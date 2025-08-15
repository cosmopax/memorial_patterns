# Deprecated Versions

This folder contains deprecated versions of important files that are still referenced 
for historical context or backward compatibility.

## Structure
- `custom_instructions/` - Previous versions of custom instructions
- `docs/` - Deprecated documentation
- `prompts/` - Deprecated prompt templates

## Naming Convention
Files should be named with the format: `filename_vX.Y.md` where X.Y is the version number.

## Automatic Management
When a new version of a file is created, the previous version should be automatically 
moved here using the `scripts/update_references.sh` script.