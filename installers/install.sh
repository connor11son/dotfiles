chmod +x ~/.dotfiles/installers/install_*.sh

./install_base.sh

# refresh path with new tools installed
source ~/.dotfiles/config/bash/rc 

./install_go.sh
./install_cargo.sh
