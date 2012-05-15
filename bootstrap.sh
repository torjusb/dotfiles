#!/bin/sh

# From https://github.com/sjl/dotfiles/blob/master/bin/bootstrap.sh
function ensure_link {
	    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

ensure_link "Development/dotfiles/vim"           ".vim"
ensure_link "Development/dotfiles/vimrc"         ".vimrc"
ensure_link "Development/dotfiles/zshrc"         ".zshrc"
ensure_link "Development/dotfiles/gitconfig"     ".gitconfig"
ensure_link "Development/dotfiles/pentadactyl"   ".pentadactyl"
ensure_link "Development/dotfiles/pentadactylrc" ".pentadactylrc"

