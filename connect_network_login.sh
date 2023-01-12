#!/bin/bash

iwconfig_list=()
#storing the iwconfig names here

while read -r line; do
iwconfig_list+=("$line")
done < <(iwconfig 2>&1 | grep -oP "^\w+")
# enumeration of iwconfig names

for i in "${!iwconfig_list[@]}"; do
echo "$((i+1)). ${iwconfig_list[$i]}"
done

echo "Enter the number of the iwconfig name you want to use: "
read iwconfig_num
selected_interface="${iwconfig_list[$iwconfig_num-1]}"

list=()
#storing the available networks here

while read -r line; do
list+=("$line")
done < <(sudo iwlist "$selected_interface" scan 2>&1 | grep "ESSID" | awk -F '"' '{print $2}')
# enumeration of available network names

for i in "${!list[@]}"; do
echo "$((i+1)). ${list[$i]}"
done

echo "Enter the number of the network you want to connect to: "
read num
selected_network="${list[$num-1]}"
echo "Enter the password for the network $selected_network: "
read password

# Check if the interface is already connected
if [[ $(sudo dhclient -v "$selected_interface" 2>&1 | grep -c "bound") -gt 0 ]]; then
    echo "Error: The interface is already connected to a network, please disconnect from the current network before connecting to a new one."
    echo "Do you want to stop the current connection? (Y/N)"
    read stop_conn
    if [[ $stop_conn == "Y" || $stop_conn == "y" ]]; then
        # Stop the current connection
        # Stop the current connection
        sudo ifconfig "$selected_interface" down

        sudo dhclient -r "$selected_interface"
        sleep 2
        exit 1
    else
        echo "Exiting script..."
        exit 1
    fi

fi

# Use wpa_supplicant to connect to the network with the provided password
wpa_passphrase "$selected_network" "$password" | sudo tee /etc/wpa_supplicant.conf > /dev/null
sudo wpa_supplicant -B -i "$selected_interface" -c /etc/wpa_supplicant.conf

# Try to connect to the selected network
if [[ $(sudo dhclient -v "$selected_interface" 2>&1 | grep -c "bound") -gt 0 ]]; then
    echo "Successfully connected to network: $selected_network"
else
    echo "Error: Failed to connect to network: $selected_network"
    exit 1
fi

