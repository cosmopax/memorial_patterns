#!/bin/bash
# Repository health check script for memorial_patterns

set -e

echo "🔍 Memorial Patterns Repository Health Check"
echo "=========================================="

# Check that knowledge index files exist
echo "📋 Validating Knowledge Index..."
missing_files=0
while IFS=',' read -r path title tags last_updated; do
  if [ "$path" != "path" ]; then
    if [ ! -f "$path" ]; then
      echo "❌ MISSING: $path"
      missing_files=$((missing_files + 1))
    fi
  fi
done < indexes/kb_index.csv

if [ $missing_files -eq 0 ]; then
  echo "✅ All knowledge index files exist"
else
  echo "❌ $missing_files files missing from knowledge index"
  exit 1
fi

# Check directory structure
echo ""
echo "🏗️  Validating Directory Structure..."
required_dirs=("prompts" "deep_research_outputs" "docs" "indexes" "scripts" "deep_research_outputs/literature_maps")
missing_dirs=0

for dir in "${required_dirs[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "❌ MISSING DIRECTORY: $dir"
    missing_dirs=$((missing_dirs + 1))
  fi
done

if [ $missing_dirs -eq 0 ]; then
  echo "✅ All required directories exist"
else
  echo "❌ $missing_dirs directories missing"
  exit 1
fi

# Check for duplicate content (basic check)
echo ""
echo "🔍 Checking for Content Issues..."
if grep -q "^# memorial_patterns — Vision, Overview & Roadmap$" docs/vision_overview_roadmap.md; then
  dup_lines=$(grep -c "^# memorial_patterns — Vision, Overview & Roadmap$" docs/vision_overview_roadmap.md)
  if [ $dup_lines -gt 1 ]; then
    echo "❌ Duplicate headers found in vision_overview_roadmap.md"
    exit 1
  else
    echo "✅ No duplicate headers in vision document"
  fi
fi

echo ""
echo "🎉 Repository health check passed!"
echo "📊 Summary:"
echo "   - $(wc -l < indexes/kb_index.csv) files in knowledge index (including header)"
echo "   - $(find prompts/ -name "*.md" | wc -l) prompt files"
echo "   - $(find docs/ -name "*.md" | wc -l) documentation files"
echo "   - $(find deep_research_outputs/ -name "*.md" | wc -l) research output files"