#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# To be used with Chromium
export GOOGLE_API_KEY=AIzaSyAKaGpQenHubM364lpfeWPtgfgrstlEHZY
export GOOGLE_DEFAULT_CLIENT_ID=382778178937-hif7glfmqllvkhjdtjemn6q6dlfh40gf.apps.googleusercontent.com
export GOOGLE_DEFAULT_CLIENT_SECRET=RzAo3JLyzYNQPAHbyccroMf4

# Github
export HOMEBREW_GITHUB_API_TOKEN=5e379fedf0671c9b55495b4cd2408cd6f2af73c6

# Disable homebrew auto update
export HOMEBREW_NO_AUTO_UPDATE=1
export TEXMFHOME="$HOME/texmf/"
export GPGKEY=C535A26E

# React Native Java setup
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"


# brew info openssl
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"

if [ -e /Users/guto/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/guto/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Single export PATH call
export PATH="/usr/local/opt/texinfo/bin:$HOME/.asdf/bin:$HOME/.asdf/shims:$ANDROID_HOME/emulator:$PATH:$ANDROID_HOME/tools:$PATH:$ANDROID_HOME/tools/bin:$PATH:$ANDROID_HOME/platform-tools:/usr/local/opt/mysql-client/bin"
