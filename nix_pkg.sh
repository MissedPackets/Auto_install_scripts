#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl build-essential

# Download the Nix installer script
curl https://nixos.org/nix/install | sh

# Add the Nix profile to your .bashrc or .bash_profile
echo ". $HOME/.nix-profile/etc/profile.d/nix.sh" >> ~/.bashrc

# Reload your shell
source ~/.bashrc

# Test that Nix is installed correctly
nix-env -v
