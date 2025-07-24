#!/usr/bin/env bash

set -e
echo "Is this a desktop or server environment? (desktop/server)"

bash ./scripts/server-setup.sh

read -r ENV_TYPE
if [[ "$ENV_TYPE" == "desktop" ]]; then
    bash ./scripts/desktop-setup.sh
fi

# Link bash config
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc ~/.bashrc.backup
fi
ln -sf "$(pwd)/config/bash/.bashrc" ~/.bashrc

# link all configs
bash ./scripts/link-configs.sh