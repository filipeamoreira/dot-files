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
alias be='bundle exec'
alias v='vagrant'
alias grep='/usr/local/bin/ggrep'
alias dps='docker ps | cut -c-$(tput cols)'
alias ds=dps
alias d='docker'
alias dc='docker-compose'

# Emacs aliases
export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacs="$EMACS -nw"
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias ec=emacsclient -n
alias ecc=emacsclient -cn

alias vpn-on="echo 'Application("Tunnelblick").connect("FL-VPN")' | osascript -l JavaScript"
alias vpn-off="echo 'Application("Tunnelblick").disconnect("FL-VPN")' | osascript -l JavaScript"

# https://github.com/junegunn/fzf
# command-line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# ctrl+o opens Visual Studio Code on current folder or file
FZF_DEFAULT_OPTS="--bind='ctrl-o:execute-silent(code {})+abort'"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# autojump
#   Use `j`
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Load functions
source ~/.functions.sh

# source: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"

youtube-dl_video_and_audio_best_no_mkv_merge () {
  video_type=$(youtube-dl -F "$@" | grep "video only" | awk '{print $2}' | tail -n 1)
  case $video_type in
    mp4)
      youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]' "$@";;
    webm)
      youtube-dl -f 'bestvideo[ext=webm]+bestaudio[ext=webm]' "$@";;
    *)
      echo "new best videoformat detected, please check it out! -> aborted";;
  esac
}

## vterm configuration: https://github.com/akermu/emacs-libvterm
vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
 1   else
        printf "\e]%s\e\\" "$1"
    fi
}

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi

autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd (){ print -Pn "\e]2;%m:%2~\a" }

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'

vterm_cmd() {
    local vterm_elisp
    vterm_elisp=""
    while [ $# -gt 0 ]; do
        vterm_elisp="$vterm_elisp""$(printf '"%s" ' "$(printf "%s" "$1" | sed -e 's|\\|\\\\|g' -e 's|"|\\"|g')")"
        shift
    done
    vterm_printf "51;E$vterm_elisp"
}

# Erlang docs on iex
export KERL_BUILD_DOCS="yes"

# asdf
. $HOME/.asdf/asdf.sh

# asdf java
# FIXME: Broken and not being used at the moment
# . ~/.asdf/plugins/java/set-java-home.zsh
# export JAVA_HOME="$( cd -P "$(dirname  $(dirname $(asdf which java) ))" && pwd )"

# direnv
eval "$(asdf exec direnv hook zsh)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }

# Single export PATH call
export PATH="/usr/local/opt/openjdk@8/bin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.cargo/bin:$HOME/.asdf/bin:$HOME/.asdf/shims:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$PATH:$ANDROID_HOME/tools:$PATH:$ANDROID_HOME/tools/bin:$PATH:$ANDROID_HOME/platform-tools:/usr/local/opt/mysql-client/bin"

