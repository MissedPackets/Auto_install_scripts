#!/bin/bash

# Get the list of packages installed by default
default_packages=$(dpkg --get-selections | awk '$2 == "install" { print $1 }')

# Get the list of all installed packages
all_packages=$(dpkg --get-selections | awk '{ print $1 }')

# Compare the lists and print the packages installed by the user
user_installed_packages=$(comm -23 <(echo "$all_packages") <(echo "$default_packages"))
echo "Packages installed by the user: "
echo "$user_installed_packages"
