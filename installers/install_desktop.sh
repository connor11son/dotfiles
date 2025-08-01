#!/bin/bash

PACKAGES_FILE="${HOME}/.dotfiles/packages/desktop.txt"

# Ensure the last line is read even if it doesn't end with a newline
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
    # Skip empty lines and comments
    [[ -z "$pkg" || "$pkg" =~ ^[[:space:]]*# ]] && continue

    # Check if the most recent version is already installed
    if yay -Qi "$pkg" &>/dev/null; then
        # Check if an upgrade is available
        if yay -Qu "$pkg" &>/dev/null; then
            echo "$pkg has an upgrade available. Upgrading..."
            yay -S --noconfirm --overwrite='*' "$pkg"
        else
            echo "$pkg is already at the most recent version, skipping."
        fi
        continue
    fi

    echo "Installing $pkg..."
    yay -S --noconfirm --overwrite='*' "$pkg"
done < "$PACKAGES_FILE" 