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
export HOMEBREW_GITHUB_API_TOKEN=9d687decde5b52e3a39c29e88afdd4622c47f6be
# FutureLearn design system token
export GITHUB_PACKAGES_TOKEN=6ea38380c7334e16ab91e538ccb28b4ab48f121b

# Disable homebrew auto update
export HOMEBREW_NO_AUTO_UPDATE=1
export TEXMFHOME="$HOME/texmf/"
export GPGKEY=C535A26E

# React Native Java setup
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
# export JAVA_HOME="/Users/guto/Library/Application Support/JetBrains/Toolbox/apps/AndroidStudio/ch-0/201.7042882/Android Studio.app/Contents/jre/jdk/Contents/Home"

# brew info openssl
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

export DOTNET_CLI_TELEMETRY_OPTOUT=true

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"

if [ -e /Users/guto/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/guto/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Single export PATH call
export PATH="/usr/local/opt/texinfo/bin:$HOME/.asdf/bin:$HOME/.asdf/shims:$ANDROID_HOME/emulator:$PATH:$ANDROID_HOME/tools:$PATH:$ANDROID_HOME/tools/bin:$PATH:$ANDROID_HOME/platform-tools:/usr/local/opt/mysql-client/bin"
