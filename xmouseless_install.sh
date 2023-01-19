#!/bin/bash

# Automatic installation script for xmouseless

# Check if the user is running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Ask the user for confirmation
read -p "Are you sure you want to install xmouseless? (y/n) " confirm

if [ "$confirm" != "y" ]; then
    echo "Installation cancelled."
    exit 0
fi

# Clone the xmouseless repository from Github
git clone https://github.com/neonatomic/xmouseless.git

# Enter the xmouseless directory
cd xmouseless

# Check if the system is using an Arch-based distro
if [ "$(uname -r)" == "arch" ]; then
    # Make and install xmouseless
    make
    sudo make install
else
    # Install required headers
    sudo apt-get install libx11-dev libxtst-dev
    # Make and install xmouseless
    make
    sudo make install
fi

echo "xmouseless has been successfully installed."
