#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='TERM=screen-16color /usr/local/opt/emacs/bin/emacsclient --tty -nw'
export VISUAL='TERM=screen-16color /usr/local/opt/emacs/bin/emacsclient --tty -nw'
export PAGER='less'

#
# Language
#

# if [[ -z "$LANG" ]]; then
#   export LANG='en_GB.UTF-8'
# fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

function run_after_save {
  prefix=$1
  file=$2
  line=$3
  if [ -z "$line" ]; then
    nodemon -x "$prefix $file" -w "$file"
  else
    nodemon -x "$prefix $file:$line" -w "$file"
  fi
}

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
