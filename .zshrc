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

unalias e

# Aliases

alias gs='git status'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gl='git pull'
alias gp='git push'
alias gb='git branch -a -v'
alias g='git'
alias b='bundle exec'
