# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# POWERLEVEL9K_MODE='Source Code Pro for Powerline'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# https://superuser.com/questions/655607/removing-the-useless-space-at-the-end-of-the-right-prompt-of-zsh-rprompt
# ZLE_RPROMPT_INDENT=0

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
alias v='vagrant'

alias dps='docker ps | cut -c-$(tput cols)'
alias ds=dps

# Emacs aliases
alias emd='/usr/local/bin/emacs --daemon'
alias em='TERM=screen-16color /usr/local/bin/emacsclient --tty -nw'
alias emacs='TERM=screen-16color /usr/local/bin/emacsclient --tty -nw'
alias emn='/usr/local/bin/emacsclient -c --no-wait'
alias emacs-gui='/usr/local/bin/emacsclient -c --no-wait'

export TEXMFHOME="$HOME/texmf/"

# See .zprofile
# Editors
#
# export EDITOR=~/bin/EDITOR
# export VISUAL=~/bin/EDITOR
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
export PAGER='less'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# . /Users/guto/.nix-profile/etc/profile.d/nix.sh
# Nix is setting SSL_CERT_FILE and this breaks homebrew
# unset SSL_CERT_FILE

export GPGKEY=C535A26E

# go
# export GOPATH=$HOME/.go
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# export ASDFINSTALLS=$HOME/.asdf/installs
# GOV=$(~/.asdf/bin/asdf current golang | sed  's/ (set by .*)//g')
# export GOROOT=$ASDFINSTALLS/golang/$GOV/go/

# export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# source /usr/local/share/gem_home/gem_home.sh
# export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
export PATH="/usr/local/opt/texinfo/bin:$PATH"

# https://github.com/junegunn/fzf
# command-line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Language version managers

# asdf

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# Prepend programming language binaries via ASDF shims
PATH="$HOME/.asdf/bin:$PATH"
PATH="$HOME/.asdf/shims:$PATH"
