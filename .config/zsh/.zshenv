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
# export CPPFLAGS="-I/usr/local/opt/openjdk@8/include"
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export ANDROID_SDK=$HOME/Library/Android/sdk
# export ANDROID_NDK=$HOME/Library/Android/sdk/ndk/22.1.7171670
# export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home/
. ~/.asdf/plugins/java/set-java-home.zsh

# brew info openssl
# export LDFLAGS="-L/usr/local/opt/openssl/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl/include"

export DOTNET_CLI_TELEMETRY_OPTOUT=true

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"

