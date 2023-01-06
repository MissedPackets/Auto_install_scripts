#!/bin/bash

# iwconfig 2>&1 | grep -oP "^\w+"

list=()
#storing the ids here

while read -r line; do
list+=("$line")
done < <(iwconfig 2>&1 | grep -oP "^\w+")
# enumeration of iwconfig names

for i in "${!list[@]}"; do
echo "$((i+1)). ${list[$i]}"
done

echo "Enter the number of the name you want to select: "
read num
echo "${list[$num-1]}"
sudo ethtool "${list[$num-1]}" |grep "Supports Wake-on"
