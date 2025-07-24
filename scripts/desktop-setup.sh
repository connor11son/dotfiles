#!/usr/bin/env bash

set -e

echo "Installing desktop packages..."
if command -v pacman &> /dev/null; then
    xargs -a packages/desktop-packages.txt -r sudo pacman -S --needed --noconfirm
else
    echo "No supported package manager found for desktop packages."
    exit 1
fi
echo "Desktop setup complete." 