#!/usr/bin/env zsh

# Default logging mechanism (fallback to echo)
log_message=${log_message:-echo}

# Starship prompt configuration
STARSHIP_CONFIG_DIR="$HOME/.config/starship"
STARSHIP_CONFIG_FILE="$STARSHIP_CONFIG_DIR/starship.toml"

# Check for Starship configuration
if [[ ! -f $STARSHIP_CONFIG_FILE ]]; then
    $log_message "Error: Starship configuration file not found in $STARSHIP_CONFIG_DIR."
    return
fi

$log_message "==> ZAP PLUGIN loading - zsh-starship"

# Configure Starship if executable is available
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
    $log_message "    -- STARSHIP is configured to use '$STARSHIP_CONFIG_FILE'."
else
    $log_message "Error: Starship executable not found in PATH."
fi
