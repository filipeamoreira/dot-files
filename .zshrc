# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="robbyrussell"
#export ZSH_THEME="bira"
# export ZSH_THEME="jreese"

export ZSH_THEME="kennethreitz"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 ruby brew cap github node npm osx pip redis-cli rvm ssh-agent)
# plugins=(git rails3)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export TERM=xterm-256color
source ~/.rvm/scripts/rvm
export PATH=/Users/guto/bin:/Users/guto/.rvm/gems/ruby-1.9.2-p180/bin:/Users/guto/.rvm/gems/ruby-1.9.2-p180@global/bin:/Users/guto/.rvm/rubies/ruby-1.9.2-p180/bin:/Users/guto/.rvm/bin:/Users/guto/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
