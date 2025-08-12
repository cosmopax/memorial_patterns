#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CI_PATH="$REPO_DIR/prompts/custom_instructions_v2.md"
echo "==> CI source: $CI_PATH"
[[ -f "$CI_PATH" ]] || { echo "ERROR: custom_instructions_v2.md not found." >&2; exit 1; }
echo "==> Preview (first 20 lines):"; head -n 20 "$CI_PATH" || true; echo
cat <<'EOF'
=== How to apply CI v2 (manual, safe) ===
1) ChatGPT (Plus): Settings → Custom Instructions → paste the full file. Start a new chat.
2) Jules (GitHub): Reference CI v2 in task descriptions; keep AGENTS.md pointing to it.
3) Copilot Chat/CLI: GitHub → Copilot → Personal Instructions: paste distilled bullets.
4) Gemini CLI: Start session with CI v2 as system prompt.
5) Qwen/local: Pass CI v2 as system message at startup.
NOTE: This script does not touch external apps (no secrets).
EOF
