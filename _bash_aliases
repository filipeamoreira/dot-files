### Bash alias file
### Peter Aronoff
### 2010-08-10
### Modified by Filipe A Moreira (c) 2011

# enable color support of ls and also add handy aliases
if [[ "$TERM" != "dumb" ]]; then
    alias dir='ls --format=vertical'
    alias vdir='ls --format=long'
fi

# aliases for safety
alias rmi='rm -i'
alias cpi='cp -i'
alias mvi='mv -i'

# aliases for clarity
alias cpv='gcp -v'
alias rmv='grm -v'
alias mvv='gmv -v'

# a few git aliases
alias gs='git status'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gl='git pull'
alias gp='git push'
alias gb='git branch -a -v'
# alias g='git'

alias e='emacsclient -c -n'
alias ec='emacsclient -nw'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
