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

# Used with monies
export MONDO_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaSI6Im9hdXRoY2xpZW50XzAwMDA5NFB2SU5ER3pUM2s2dHo4anAiLCJleHAiOjE0NjQxMDg5MzQsImlhdCI6MTQ2MzkzNjEzNCwianRpIjoidG9rXzAwMDA5OFN5Qk14WWJPS09BNU1GSTkiLCJ1aSI6InVzZXJfMDAwMDk2VUh6dHowNjJ2WlJobkFpZiIsInYiOiIyIn0.Lxmt4PHf_BozgGy0mm3XSB1eVir-YKqOK6sK8N5ymTs

# Used with homebrew
export HOMEBREW_GITHUB_API_TOKEN=c8ae05946a7eb6b7cb97645769df92cf8373e2a4
# To be used with Chromium
export GOOGLE_API_KEY=AIzaSyAKaGpQenHubM364lpfeWPtgfgrstlEHZY
export GOOGLE_DEFAULT_CLIENT_ID=382778178937-hif7glfmqllvkhjdtjemn6q6dlfh40gf.apps.googleusercontent.com
export GOOGLE_DEFAULT_CLIENT_SECRET=RzAo3JLyzYNQPAHbyccroMf4
