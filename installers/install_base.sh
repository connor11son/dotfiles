set -e

# # setup files
mkdir -p ~/.local/bin

# # install direnv
# curl -sfL https://direnv.net/install.sh | bash

# install rust toolchain if not already installed
if command -v rustc >/dev/null 2>&1; then
    echo "✓ Rust is already installed (rustc found)"
else
    echo "Installing Rust toolchain..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# install Go toolchain if not already installed
if command -v go >/dev/null 2>&1; then
    echo "✓ Go is already installed (go found)"
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
fi
