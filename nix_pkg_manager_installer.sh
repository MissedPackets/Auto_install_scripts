#!/usr/bin
unset NIX_REMOTE
sudo apt install nix-bin
a=$(read -p)
echo "Installing Nix's package manager..."
sh <(curl -L "https://releases.nixos.org/nix/nix-2.9.1/install") --no-daemon
#Incase there is a sqlite error .e.g) SQLite database '/nix/var/nix/db/db.sqlite' is busy...
sandbox = false > ~/.config/nix/nix.conf

echo -e "Nix's package manager has finished installing! Try to run this command to test if there are no errors: \n nix-env -i hello"
unset NIX_REMOTE
