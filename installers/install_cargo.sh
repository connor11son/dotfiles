#!/bin/bash

TOOLS_FILE="${HOME}/.dotfiles/packages/cargo.txt"

# Ensure the last line is read even if it doesn't end with a newline
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
    # Skip empty lines and comments
    [[ -z "$pkg" || "$pkg" =~ ^[[:space:]]*# ]] && continue

    # Check if this is a git installation (format: package:git:url)
    if [[ "$pkg" =~ ^([^:]+):git:(.+)$ ]]; then
        package_name="${BASH_REMATCH[1]}"
        git_url="${BASH_REMATCH[2]}"
        echo "Installing $package_name from git repository..."
        cargo install --git "$git_url" "$package_name"
    else
        echo "Installing $pkg..."
        cargo install "$pkg"
    fi
done < "$TOOLS_FILE"
