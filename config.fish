set -g fish_user_abbreviations
abbr --add g 'git'
#set -U fish_user_abbreviations $fish_user_abbreviations 'g=git'
#set -U fish_user_abbreviations $fish_user_abbreviations 'less=less -j 4'

set -x LC_ALL en_US.UTF-8

set PATH $HOME/.config/yarn/global/node_modules/.bin $PATH
set PATH $HOME/tizen-studio/tools/ide/bin $PATH
set PATH $HOME/tizen-studio/emulator/bin $PATH
set PATH $HOME/tizen-studio/tools $PATH
set PATH $PATH /usr/local/share/npm/bin
set PATH $PATH /usr/local/opt/ruby/bin
set PATH $PATH /usr/local/lib/python2.7/site-packages

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3
