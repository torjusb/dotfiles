#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config
mkdir -p ~/.atom

# From https://github.com/sjl/dotfiles/blob/master/bin/bootstrap.sh
function ensure_link {
	    test -L "$HOME/$2" || ln -s "$DOTFILES_DIR/$1" "$HOME/$2"
}

# Vim
ensure_link "vim"           ".vim"
ensure_link "vimrc"         ".vimrc"

# Zsh & Prezto
ensure_link "zsh/zshrc"     ".zshrc"
ensure_link "zsh/zlogin"    ".zlogin"
ensure_link "zsh/zpreztorc" ".zpreztorc"

# Git
ensure_link "git/gitconfig" ".gitconfig"

# Pentadactyl
ensure_link "pentadactyl"   ".pentadactyl"
ensure_link "pentadactylrc" ".pentadactylrc"

# Tmux
ensure_link "tmux.conf"     ".tmux.conf"

# CTags
ensure_link "ctags"         ".ctags"

# Powerline
ensure_link "powerline"     ".config/powerline"

# Ack
ensure_link "ackrc"         ".ackrc"

# ESLint
ensure_link "eslintrc"		".eslintrc"

# Atom
ensure_link "atom/init.cson"		".atom/init.cson"
ensure_link "atom/config.cson"		".atom/config.cson"
ensure_link "atom/keymap.cson"		".atom/keymap.cson"
ensure_link "atom/snippets.cson"	".atom/snippets.cson"
ensure_link "atom/styles.less"		".atom/styles.less"
