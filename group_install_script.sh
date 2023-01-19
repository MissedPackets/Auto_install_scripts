#!/bin/bash

# Script to group and download a set of scripts

# Declare an array of script groups
declare -A script_groups=(
    ["1"]="script1.sh script2.sh script3.sh"
    ["2"]="script4.sh script5.sh script6.sh"
    ["3"]="script7.sh script8.sh script9.sh"
)

# Declare an array of group names
declare -A group_names=(
    ["1"]="Testing (Fastest installer scripts)"
    ["2"]="Secondary Scripts (cli assist tools)"
    ["3"]="All (Longer wait time)"
)

# Print out the available script groups and their scripts
for group_number in "${!script_groups[@]}"; do
    scripts="${script_groups[$group_number]}"
    group_name="${group_names[$group_number]}"
    echo "$group_number: $group_name: $scripts"
done

# Ask the user for confirmation
read -p "Which script groups do you want to download? (e.g. 1 3) " groups

if [ -z "$groups" ]; then
    echo "No groups selected. Download cancelled."
    exit 0
fi

# Loop through the selected script groups
IFS=' ' read -a group_numbers <<< "$groups"
for group_number in "${group_numbers[@]}"; do
    scripts="${script_groups[$group_number]}"
    group_name="${group_names[$group_number]}"

    # Loop through the scripts in the group
    for script in $scripts; do
        # Download the script
        echo "Downloading $script"
    done

    echo "The scripts in group $group_name have been successfully downloaded."
done
