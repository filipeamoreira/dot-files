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

export RBENV_ROOT=/usr/local/var/rbenv
export PYENV_ROOT=/usr/local/opt/pyenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
source /usr/local/opt/pyenv/completions/pyenv.zsh
. ~/.profile
eval "$(hub alias -s)"

export PATH="/Applications/calibre.app/Contents/console.app/Contents/MacOS:$PATH"

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
