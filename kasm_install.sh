#!/bin/bash

# Automatic installation script for kasm

# Check if the user is running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Ask the user for confirmation
read -p "Are you sure you want to install kasm? (y/n) " confirm

if [ "$confirm" != "y" ]; then
    echo "Installation cancelled."
    exit 0
fi

# Get the download link for the latest kasm release
download_link=$(curl -L https://kasm-static-content.s3.amazonaws.com/ | grep -o "https://kasm-static-content.s3.amazonaws.com/kasm_release_.*.tar.gz")

# Download the kasm binary
wget $download_link

# Unzip the binary
tar -xzf kasm_release_*.tar.gz

# Remove the downloaded archive
rm kasm_release_*.tar.gz

# Run the kasm binary
./kasm

echo "kasm has been successfully installed and is now running."
