#!/bin/sh

# From https://github.com/sjl/dotfiles/blob/master/bin/bootstrap.sh
function ensure_link {
	    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

# Vim
ensure_link "Development/dotfiles/vim"           ".vim"
ensure_link "Development/dotfiles/vimrc"         ".vimrc"

# Zsh & Prezto
ensure_link "Development/dotfiles/zsh/zshrc"     ".zshrc"
ensure_link "Development/dotfiles/zsh/zlogin"    ".zlogin"
ensure_link "Development/dotfiles/zsh/zpreztorc" ".zpreztorc"

# Git
ensure_link "Development/dotfiles/git/gitconfig" ".gitconfig"

# Pentadactyl
ensure_link "Development/dotfiles/pentadactyl"   ".pentadactyl"
ensure_link "Development/dotfiles/pentadactylrc" ".pentadactylrc"

# Tmux
ensure_link "Development/dotfiles/tmux.conf"     ".tmux.conf"

