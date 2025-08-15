set -e

# # setup files
mkdir -p ~/.local/bin

# # install direnv
# curl -sfL https://direnv.net/install.sh | bash

# install rust toolchain in home dir if not already installed there
if [ -x "$HOME/.cargo/bin/rustc" ]; then
    echo "✓ Rust is already installed in $HOME/.cargo/bin (rustc found)"
else
    echo "Installing Rust toolchain to $HOME/.cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain stable --profile default
fi

# install Go toolchain in $HOME/.local if not already installed there
if [ -x "$HOME/.local/go/bin/go" ]; then
    echo "✓ Go is already installed in $HOME/.local/go (go found)"
else
    V=$(curl -s https://go.dev/VERSION?m=text | head -n1 | cut -d' ' -f1)
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')
    echo "Go installer: OS: $OS, Architecture: $ARCH"
    mkdir -p ~/Downloads
    echo "Downloading Go $V..."
    curl -L https://go.dev/dl/$V.$OS-$ARCH.tar.gz -o ~/Downloads/$V.$OS-$ARCH.tar.gz
    mkdir -p ~/.local
    rm -rf ~/.local/go
    tar -C ~/.local -xzf ~/Downloads/$V.$OS-$ARCH.tar.gz
    echo "✓ Go installed to $HOME/.local/go"
fi
