#!/usr/bin/env bash

set -e
source ./scripts/env
echo "Is this a desktop or server environment? (desktop/server)"
read -r ENV_TYPE
if [[ "$ENV_TYPE" == "desktop" ]]; then
    source ./scripts/desktop
fi

source ./scripts/server

# Link bash config
ln -sf "$(pwd)/config/bash/.bashrc" ~/.bashrc

# link all configs
source ./scripts/configs