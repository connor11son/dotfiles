#!/usr/bin/env bash

set -e

echo "Installing cargo packages (server setup)..."
if ! command -v cargo &> /dev/null; then
    echo "cargo not found. Please install Rust and Cargo first."
    exit 1
fi
xargs -a packages/cargo-packages.txt -r cargo install
echo "Server setup complete."

# Ensure ~/.cargo/bin is in PATH for future logins (add to ~/.bashrc)
if ! grep -Fxq "$CARGO_PATH_LINE" "$BASHRC_FILE"; then
    echo "$CARGO_PATH_LINE" >> "$BASHRC_FILE"
    echo 'Added ~/.cargo/bin to PATH in $BASHRC_FILE.'
else
    echo '~/.cargo/bin is already in PATH in $BASHRC_FILE.'
fi 