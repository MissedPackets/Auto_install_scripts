#!/bin/bash

# Get all of the names on the left column of the output of the `snap list` command
names=($(snap list | awk '{print $1}'))

# Loop through the names and run `sudo snap remove --purge` on each
for name in "${names[@]}"; do
    sudo snap remove --purge "$name"
done

sudo apt remove --autoremove snapd

if ! grep -q "Package: snapd" /etc/apt/preferences.d/nosnap.pref; then
    sudo echo "Package: snapd
    Pin: release a=*
    Pin-Priority: -10" >> /etc/apt/preferences.d/nosnap.pref
fi
