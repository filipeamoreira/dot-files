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

export PATH="/Applications/calibre.app/Contents/console.app/Contents/MacOS:$PATH"
export AWS_ACCESS_KEY_ID="AKIAIXQGVWKQK3U5OPAA"
export AWS_SECRET_ACCESS_KEY="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"

# Github token for homebrew
export HOMEBREW_GITHUB_API_TOKEN="62ef7c5e937335e21322d912d0e37da1d777148d"
