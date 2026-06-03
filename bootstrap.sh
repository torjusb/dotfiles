#!/usr/bin/env bash
# Symlink everything under home/ into $HOME, mirroring the directory layout.
#
# For each tracked file, the script links the *deepest* sensible target:
#   - top-level dotfiles (e.g. .gitconfig) are linked directly
#   - self-contained config dirs (fish, nvim, ghostty, git, delta) are linked
#     as whole directories so the repo owns them outright
#   - individual files inside shared dirs (.config root, .claude) are linked
#     per-file so unrelated neighbours are left untouched
#
# Existing real files/dirs are backed up to <name>.bak before linking.
# Re-running is safe: correct links are skipped, stale ones are repointed.

set -euo pipefail

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC="$DOTFILES_DIR/home"

# Link whole directories (repo owns the entire dir).
DIRS=(
  ".config/fish"
  ".config/nvim"
  ".config/ghostty"
  ".config/git"
  ".config/delta"
  ".claude/skills/prep-commit"
  ".claude/skills/tidslogg"
)

# Link individual files (dir is shared with untracked neighbours).
FILES=(
  ".gitconfig"
  ".config/starship.toml"
  ".config/gitignore_global"
  ".claude/settings.json"
  ".claude/statusline-command.sh"
)

link() {
  local src="$1" dest="$2"
  if [ -L "$dest" ]; then
    [ "$(readlink "$dest")" = "$src" ] && { echo "ok    $dest"; return; }
    rm "$dest"
  elif [ -e "$dest" ]; then
    echo "backup $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "link  $dest"
}

for d in "${DIRS[@]}";  do link "$SRC/$d" "$HOME/$d"; done
for f in "${FILES[@]}"; do link "$SRC/$f" "$HOME/$f"; done

echo
echo "Done. Reminders:"
echo "  - fish plugins: run 'fisher update' to install from fish_plugins"
echo "  - nvim: launch nvim once to let lazy.nvim sync plugins"
