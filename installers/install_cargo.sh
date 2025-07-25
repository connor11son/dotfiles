#!/bin/bash

TOOLS_FILE="${HOME}/.dotfiles/packages/cargo.txt"

# Ensure the last line is read even if it doesn't end with a newline
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
    # Skip empty lines and comments
    [[ -z "$pkg" || "$pkg" =~ ^[[:space:]]*# ]] && continue

    echo "Installing $pkg..."
    cargo install "$pkg"
done < "$TOOLS_FILE"
