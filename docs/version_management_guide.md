# Version Management Test Guide

This guide demonstrates how to use the automatic reference updating system.

## Example Workflow: Creating a new version

1. **Find all current references:**
   ```bash
   ./scripts/update_references.sh find-refs prompts/custom_instructions_v2.md
   ```

2. **Create a new version (example):**
   ```bash
   # Copy current version to new version  
   cp prompts/custom_instructions_v2.md prompts/custom_instructions_v3.md
   # Edit the new version as needed
   ```

3. **Deprecate the old version:**
   ```bash
   ./scripts/update_references.sh deprecate prompts/custom_instructions_v2.md 2.1
   ```

4. **Update all references to point to new version:**
   ```bash
   ./scripts/update_references.sh update-file prompts/custom_instructions_v2.md prompts/custom_instructions_v3.md
   ```

5. **Verify no broken references:**
   ```bash
   ./scripts/update_references.sh check-refs
   ```

## Script Commands

- `find-refs <file>` - Find all references to a file
- `update-file <old> <new>` - Update references from old to new file  
- `deprecate <file> [version]` - Move file to deprecated/ folder
- `check-refs` - Check for broken references

## Current Status
- ✅ `prompts/custom_instructions_v2.md` v2.1 is active and working
- ✅ 15 files correctly reference the policy file
- ✅ No broken references found