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
alias grep='/usr/local/bin/ggrep'
alias dps='docker ps | cut -c-$(tput cols)'
alias ds=dps

# Emacs aliases
alias e='TERM=screen-16color /usr/local/opt/emacs/bin/emacsclient --tty -nw'
alias emacs='/usr/local/opt/emacs/bin/emacsclient -c --no-wait'

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

. /Users/guto/.nix-profile/etc/profile.d/nix.sh
# Nix is setting SSL_CERT_FILE and this breaks homebrew
# unset SSL_CERT_FILE

# Docker setup
# https://github.com/docker/for-mac/issues/1948
autoload -Uz compinit; compinit

# https://github.com/junegunn/fzf
# command-line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autojump
#   Use `j`
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# asdf

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# Prepend programming language binaries via ASDF shims
PATH="$HOME/.asdf/bin:$PATH"
PATH="$HOME/.asdf/shims:$PATH"

# OPAM configuration
. /Users/guto/.asdf/installs/ocaml/4.06.1/opam-init/init.zsh > /dev/null 2> /dev/null || true
