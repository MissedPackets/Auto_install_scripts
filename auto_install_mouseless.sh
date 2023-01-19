#!/bin/bash

# Automatic installation script for mouseless

# Check if the user is running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Ask the user for confirmation to install mouseless
read -p "Are you sure you want to install mouseless? (y/n) " confirm

if [ "$confirm" != "y" ]; then
    echo "Installation cancelled."
    exit 0
fi

# Install Go if not already installed
if ! [ -x "$(command -v go)" ]; then
    echo "Installing Go..."
    apt-get install go
fi

# Download the source code
git clone https://github.com/jbensmann/mouseless.git

# Build the binary
cd mouseless
go build -ldflags="-s -w" .

# Install the binary
cp mouseless /usr/local/bin

# Clean up
cd ..
rm -rf mouseless

echo "mouseless has been successfully installed."

# Ask the user if they want to bind mouseless to xbindkeys
read -p "Do you want to bind mouseless to xbindkeys? (y/n) " xbindkeys_confirm

if [ "$xbindkeys_confirm" != "y" ]; then
    echo "Binding to xbindkeys skipped."
    exit 0
fi

# Install xbindkeys if not already installed
if ! [ -x "$(command -v xbindkeys)" ]; then
    echo "Installing xbindkeys..."
    apt-get install xbindkeys
fi

# Create a configuration file for xbindkeys
touch ~/.xbindkeysrc

# Open the configuration file and add the binding for mouseless
echo "\"/usr/local/bin/mouseless --config ~/.config/mouseless/config.yaml\"
    Ctrl + shift + a" >> ~/.xbindkeysrc

# Start xbindkeys in the background
xbindkeys &

# Add xbindkeys to the startup applications
#sudo nano /etc/xdg/autostart/xbindkeys.desktop
echo "Exec=xbindkeys" >> /etc/xdg/autostart/xbindkeys.desktop

echo "mouseless has been successfully bound to xbindkeys and set to run on startup."
