# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each

# Nice themes: bira, cloud
# Nice themes to study: smt
export ZSH_THEME="kennethreitz"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TITLE="true"

plugins=(git compleat rails ruby brew github node npm osx pip redis-cli rvm ssh-agent)

source $ZSH/oh-my-zsh.sh

[ -n "$TMUX" ] && export TERM=screen-256color

[[ $TERM == eterm-color ]] && export TERM=xterm
[[ $EMACS = t ]] && unsetopt zle

# Cannot use the current Emacs server because the buffer is loaded as read only
# GIT_EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"; export GIT_EDITOR
GIT_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -Q -t $(tty)"; export GIT_EDITOR

export PATH="/Applications/B1FreeArchiver.app/Contents/MacOS:/Users/guto/.nvm/v0.10.5/bin:/Users/guto/bin:/usr/local/var/rbenv/shims:/Users/guto/bin:/usr/X11/bin:/usr/local/bin:/usr/local/sbin:/Applications/Racket v5.2/bin:/Users/guto/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

#. ~/.nvm/nvm.sh

export RBENV_ROOT=/usr/local/var/rbenv
source "$HOME/bin/rb.sh"
source "`brew --prefix grc`/etc/grc.bashrc"
eval "$(hub alias -s)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
. ~/.profile
