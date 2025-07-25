#!/bin/bash

TOOLS_FILE="${HOME}/.dotfiles/packages/cargo.txt"

while IFS= read -r pkg; do
    # Skip empty lines and comments
    [[ -z "$pkg" || "$pkg" =~ ^[[:space:]]*# ]] && continue

    echo "Installing $pkg..."
    cargo install "$pkg"
done < "$TOOLS_FILE"
