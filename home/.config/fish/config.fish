set -gx TERM screen-256color-bce

set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
starship init fish | source

# VI mode
set -g fish_key_bindings fish_hybrid_key_bindings

alias cat="bat"
alias ls="eza -a --icons --no-user --no-time --hyperlink"
alias g="git"
alias vi="nvim"
alias p="pnpm"
alias repl="deno repl"
alias nvm="fnm"
alias cc="claude"

set -U fish_emoji_width 2
set -U fish_color_search_match --background=blue
set -U fish_user_paths ~/.composer/vendor/bin $fish_user_paths

fish_add_path /sbin
fish_add_path /usr/sbin
fish_add_path /opt/homebrew/Cellar/mysql@5.7/5.7.38/bin/
fish_add_path /usr/local/bin
fish_add_path ~/.pyenv/shims
fish_add_path ~/.local/bin
fish_add_path ~/Library/pnpm

# Bun
set -Ux BUN_INSTALL ~/.bun
set -px --path PATH ~/.bun/bin

# bit
set -gx PATH $PATH ~/bin
# bit end

# pnpm
set -gx PNPM_HOME ~/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Highlight search results in less
set -Ux LESS_TERMCAP_so (echo -e '\e[30;43m')
set -Ux LESS_TERMCAP_se (echo -e '\e[0m')

# Added by Windsurf
fish_add_path /Users/torjus/.codeium/windsurf/bin

# Initialize pyenv
status --is-interactive; and pyenv init --path | source
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

fzf --fish | source
