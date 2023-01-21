#!/usr/bin
sudo install -d -m755 -o $(id -u) -g $(id -g) /nix

# If this all doesn't work, uncomment this to install the stable ver. of nix's pkg manager
#curl -L https://nixos.org/nix/install | sh

unset NIX_REMOTE
sudo apt install nix-bin
a=$(read -p)
echo "Installing Nix's package manager..."
sh <(curl -L "https://releases.nixos.org/nix/nix-2.9.1/install") --no-daemon
#Incase there is a sqlite error .e.g) SQLite database '/nix/var/nix/db/db.sqlite' is busy...
sandbox = false > ~/.config/nix/nix.conf

# This needs to run so that the single user has most access to the contents of /nix dir
sudo chown -R $USER:staff /nix

echo -e "Nix's package manager has finished installing!\nTry to run this command to test if there are no errors: \n nix-env -i hello\nOtherwise, if it is unstable and the version is x>2.9.1, re-run this script so that it updates the version."
unset NIX_REMOTE
source $HOME/.nix-profile/etc/profile.d/nix.sh

