# Helpful Commands — memorial_patterns

## 1) Shell gotchas (zsh)
If you ever see `zsh: event not found: /usr/bin/env` or similar, it’s history/bang expansion.
- Option A (recommended): start a bash subshell, then paste scripts:
  ```bash
  /bin/bash

(Run exit to leave bash.)

    Option B (stay in zsh): temporarily disable bang history:

    unsetopt BANG_HIST   # disable
    # ...paste & run your script...
    setopt BANG_HIST     # re-enable (optional)

2) Git identity & GitHub auth

git config --global user.name  "cosmopax"
git config --global user.email "patrick.p.schimpl@gmail.com"
gh auth status || gh auth login -p https -h github.com

3) Repo basics

cd "/Users/cosmopax/Desktop/memorial_patterns"
git status
git branch -vv
git checkout -b feat/my-change || git checkout feat/my-change
git add -A
git commit -m "<message>"
git push -u origin HEAD

4) One-shot scripts (pattern)

cat > my_script.sh <<'BASH'
#!/usr/bin/env bash
set -euo pipefail
# ... contents ...
BASH
chmod +x my_script.sh
./my_script.sh

5) PRs with GitHub CLI

gh pr create --fill --base main --head $(git branch --show-current) --web
gh pr list
gh pr view --web

6) Rollback & cleanup (careful)

git reset --soft HEAD~1       # undo last commit but keep changes staged
git reset --hard HEAD         # discard local changes (DANGEROUS)
git clean -fd                 # remove untracked files/dirs (DANGEROUS)

7) Logs & diagnostics for big scripts

mkdir -p logs
export PS4='+ [$(date "+%Y-%m-%d %H:%M:%S")] '
/bin/bash -x bootstrap_jules_dr_run01.sh \
  > >(tee -a logs/bootstrap.stdout.log) \
  2> >(tee -a logs/bootstrap.stderr.log >&2)

# Summarize errors
grep -inE 'error|fatal|fail|denied|conflict|not found|no such file|cannot|warning' logs/bootstrap.stderr.log \
  || echo "No obvious errors in stderr."
tail -n 120 logs/bootstrap.stderr.log
tail -n 120 logs/bootstrap.stdout.log

