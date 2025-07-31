#!/bin/bash

PACKAGES_FILE="${HOME}/.dotfiles/packages/desktop.txt"

# Ensure the last line is read even if it doesn't end with a newline
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
    # Skip empty lines and comments
    [[ -z "$pkg" || "$pkg" =~ ^[[:space:]]*# ]] && continue

    echo "Installing $pkg..."
    yay -S --noconfirm "$pkg"
done < "$PACKAGES_FILE" 