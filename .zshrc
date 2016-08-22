#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

case $(type e) in
    (*alias*) unalias e;;
esac

# Aliases

alias gs='git status'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gl='git pull'
alias gp='git push'
alias gb='git branch -a -v'
alias g='git'
alias b='bundle exec'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export TEXMFHOME="$HOME/texmf/"

# See .zprofile
# Editors
#

# export EDITOR='e'
# export VISUAL='e'
export PAGER='less'


if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

. /Users/guto/.nix-profile/etc/profile.d/nix.sh
# Nix is setting SSL_CERT_FILE and this breaks homebrew
unset SSL_CERT_FILE

export ANDROID_HOME=/usr/local/opt/android-sdk
