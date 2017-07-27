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

# Emacs aliases

alias emd='/usr/local/bin/emacs --daemon'
alias em='TERM=screen-16color /usr/local/bin/emacsclient --tty -nw'
alias emacs='TERM=screen-16color /usr/local/bin/emacsclient --tty -nw'
alias emn='/usr/local/bin/emacsclient -c --no-wait'
alias emacs-gui='/usr/local/bin/emacsclient -c --no-wait'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

alias wr='run_after_save "RAILS_ENV=test bundle exec rake spec_apollo_for_boosted_bets"'

export TEXMFHOME="$HOME/texmf/"

# See .zprofile
# Editors
#

# export EDITOR=~/bin/EDITOR
# export VISUAL=~/bin/EDITOR
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

export PAGER='less'


export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

. /Users/guto/.nix-profile/etc/profile.d/nix.sh
# Nix is setting SSL_CERT_FILE and this breaks homebrew
unset SSL_CERT_FILE

export ANDROID_HOME=/usr/local/opt/android-sdk

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
# export PATH=/Users/guto/scm/git/funcoeszz:$PATH
# export ZZPATH=/Users/guto/scm/git/funcoeszz/funcoeszz
# export ZZDIR=/Users/guto/scm/git/funcoeszz/zz
# source /Users/guto/.zzzshrc
# source /usr/local/share/zsh/site-functions/

export GPGKEY=C535A26E

# go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="/usr/local/opt/qt5/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# source /usr/local/share/gem_home/gem_home.sh
