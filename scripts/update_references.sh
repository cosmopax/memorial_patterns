#!/usr/bin/env bash
# Reference Update Script for memorial_patterns
# Automatically updates file references and manages deprecated versions

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEPRECATED_DIR="$REPO_ROOT/deprecated"

log() { printf "\033[1;32m==>\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m!!\033[0m %s\n" "$*"; }
error() { printf "\033[1;31mERROR:\033[0m %s\n" "$*" >&2; }

usage() {
    cat <<EOF
Usage: $0 <command> [options]

Commands:
  update-file <old_path> <new_path>  - Update references from old to new file
  deprecate <file_path> [version]    - Move file to deprecated/ folder
  find-refs <file_path>              - Find all references to a file
  check-refs                         - Check for broken references

Examples:
  $0 update-file prompts/custom_instructions_v2.md prompts/custom_instructions_v3.md
  $0 deprecate prompts/custom_instructions_v2.md 2.1
  $0 find-refs prompts/custom_instructions_v2.md
EOF
}

find_references() {
    local file_path="$1"
    local repo_root="$2"
    
    log "Searching for references to: $file_path"
    
    # Search in markdown files, excluding deprecated folder
    find "$repo_root" -name "*.md" -not -path "*/deprecated/*" -exec grep -l "$file_path" {} \; 2>/dev/null || true
    
    # Also search for relative references
    local basename=$(basename "$file_path")
    find "$repo_root" -name "*.md" -not -path "*/deprecated/*" -exec grep -l "$basename" {} \; 2>/dev/null || true
}

update_references() {
    local old_path="$1"
    local new_path="$2"
    local repo_root="$3"
    
    log "Updating references from '$old_path' to '$new_path'"
    
    # Find all files that reference the old path
    local ref_files=($(find_references "$old_path" "$repo_root"))
    
    if [ ${#ref_files[@]} -eq 0 ]; then
        warn "No references found to $old_path"
        return 0
    fi
    
    # Update each file
    for file in "${ref_files[@]}"; do
        if [[ -f "$file" ]]; then
            log "Updating references in: $file"
            # Use sed to replace the old path with new path
            sed -i.bak "s|$old_path|$new_path|g" "$file"
            rm -f "$file.bak" 2>/dev/null || true
        fi
    done
    
    log "Updated ${#ref_files[@]} files"
}

deprecate_file() {
    local file_path="$1"
    local version="${2:-}"
    local repo_root="$3"
    
    if [[ ! -f "$repo_root/$file_path" ]]; then
        error "File not found: $file_path"
        return 1
    fi
    
    # Extract version from file if not provided
    if [[ -z "$version" ]]; then
        version=$(grep -o "version: [0-9]\+\.[0-9]\+" "$repo_root/$file_path" | cut -d' ' -f2 || echo "unknown")
    fi
    
    # Determine deprecated path
    local dir_path=$(dirname "$file_path")
    local filename=$(basename "$file_path" .md)
    local deprecated_path="deprecated/${dir_path}/${filename}_v${version}.md"
    
    log "Moving $file_path to $deprecated_path"
    
    # Create deprecated directory if needed
    mkdir -p "$repo_root/$(dirname "$deprecated_path")"
    
    # Move file to deprecated location
    mv "$repo_root/$file_path" "$repo_root/$deprecated_path"
    
    log "File moved to: $deprecated_path"
}

check_broken_references() {
    local repo_root="$1"
    local broken=0
    
    log "Checking for broken file references..."
    
    # Find all markdown files and check their references
    while IFS= read -r -d '' file; do
        # Use grep to find potential file references
        grep -o '[a-zA-Z0-9_/-]*\.md' "$file" 2>/dev/null | while read -r ref; do
            # Skip empty references
            if [[ -z "$ref" ]]; then
                continue
            fi
            # Check if file exists (try both absolute and relative paths)
            if [[ ! -f "$repo_root/$ref" && ! -f "$(dirname "$file")/$ref" ]]; then
                warn "Broken reference in $file: $ref"
                ((broken++))
            fi
        done
    done < <(find "$repo_root" -name "*.md" -not -path "*/deprecated/*" -print0)
    
    if [[ $broken -eq 0 ]]; then
        log "No broken references found"
    else
        warn "Found $broken broken references"
    fi
    
    return $broken
}

main() {
    cd "$REPO_ROOT"
    
    case "${1:-}" in
        update-file)
            if [[ $# -lt 3 ]]; then
                error "update-file requires old_path and new_path arguments"
                usage
                exit 1
            fi
            update_references "$2" "$3" "$REPO_ROOT"
            ;;
        deprecate)
            if [[ $# -lt 2 ]]; then
                error "deprecate requires file_path argument"
                usage
                exit 1
            fi
            deprecate_file "$2" "${3:-}" "$REPO_ROOT"
            ;;
        find-refs)
            if [[ $# -lt 2 ]]; then
                error "find-refs requires file_path argument"
                usage
                exit 1
            fi
            find_references "$2" "$REPO_ROOT"
            ;;
        check-refs)
            check_broken_references "$REPO_ROOT"
            ;;
        *)
            usage
            exit 1
            ;;
    esac
}

main "$@"