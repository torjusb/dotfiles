set -g fish_user_abbreviations
abbr --add g 'git'
abbr --add fb 'firebase'

if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add g 'git'
    abbr --add c 'cargo'
end

set PATH $PATH ~/.cargo/bin

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_describe_style 'branch'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color blue)(prompt_pwd)(set_color yellow)(__fish_git_prompt)' '

    set_color -o
    if test "$USER" = 'root'
        echo -n (set_color red)'# '
    end
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
