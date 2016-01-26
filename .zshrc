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

source "$HOME/.zprofile"

# Nice themes: bira, cloud
# Nice themes to study: smt
export ZSH_THEME="kennethreitz"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

#plugins=(git compleat rails ruby brew github node npm osx pip redis-cli rvm ssh-agent)

ulimit -S -n 2048 # open file limit
[ -n "$TMUX" ] && export TERM=screen-256color

[[ $TERM == eterm-color ]] && export TERM=xterm
[[ $EMACS = t ]] && unsetopt zle

# Cannot use the current Emacs server because the buffer is loaded as read only
# GIT_EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"; export GIT_EDITOR
GIT_EDITOR="emacs -Q -t $(tty)"; export GIT_EDITOR

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_GC_HEAP_FREE_SLOTS=200000

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# export RBENV_ROOT=/usr/local/var/rbenv
export PYENV_ROOT=/usr/local/opt/pyenv
#source "$HOME/bin/rb.sh"
#source "`brew --prefix grc`/etc/grc.bashrc"
#eval "$(hub alias -s)"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
source /usr/local/opt/pyenv/completions/pyenv.zsh
. ~/.profile
. ~/.zprofile

# Aliases
# Git
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gl='git pull'
alias gp='git push'
alias gb='git branch -a -v'
# Rails
alias b='bundle exec'
alias bi='bundle install'

alias ssh='TERM=xterm ssh'

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias vim='emacsclient -t'
alias vi='emacsclient -t'

###-tns-completion-start-###
if [ -f /Users/guto/.tnsrc ]; then
    source /Users/guto/.tnsrc
fi
###-tns-completion-end-###
export TEXMFHOME=~/texmf
