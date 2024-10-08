#!/usr/bin/env zsh
# shellcheck disable=SC1090

echo "==> ZAP PLUGIN loading - zsh-starship"

# Exit if the 'starship' command can not be found
if ! (( $+commands[starship] )); then
    echo "ERROR: 'starship' command not found"
    return
fi

# If the 'STARSHIP_CONFIG' environment variable is not populated then change
# the default theme configuration to the one provided in this plugin
if [[ -z "$STARSHIP_CONFIG" ]]; then
    export STARSHIP_CONFIG="${0:A:h}/theme/starship.toml"
fi

  echo "    -- STARSHIP is configured to use '$STARSHIP_CONFIG'."

# Init cache directory for `starship` command
local INIT_CACHE_DIR="${0:A:h}/init"

# Only regenerate init script if older than 24 hours, or does not exist
if [[ ! -f "$INIT_CACHE_DIR/_starship"  ||  ! $(find "$INIT_CACHE_DIR/_starship" -newermt "24 hours ago" -print) ]]; then
    starship init zsh --print-full-init >| "$INIT_CACHE_DIR/_starship"
fi

# Initialise the Starship Prompt
source "$INIT_CACHE_DIR/_starship"
