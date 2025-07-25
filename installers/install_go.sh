#!/bin/bash

TOOLS_FILE="${HOME}/.dotfiles/packages/go.txt"

while IFS= read -r tool; do
    # Skip empty lines and comments
    [[ -z "$tool" || "$tool" =~ ^[[:space:]]*# ]] && continue
    
    # Extract binary name from the path
    binary_name=$(basename "$tool" | cut -d'@' -f1)
    
    # Check if already installed
    if command -v "$binary_name" >/dev/null 2>&1; then
        echo "✓ $binary_name already installed"
    else
        echo "Installing $tool..."
        go install "$tool"
    fi
done < "$TOOLS_FILE"
