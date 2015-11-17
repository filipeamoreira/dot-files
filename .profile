# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export RUBYLIB="/usr/local/lib:$RUBYLIB"
export PATH=/Applications/B1FreeArchiver.app/Contents/MacOS:/Applications/context/tex/texmf-osx-64/bin:$PATH
export HOMEBREW_GITHUB_API_TOKEN="ec7debcb2f378241c65de77df033519dbf6e66c4"
source ~/.bash_aliases
