#!/bin/bash

echo "Please select the frontend you want to install and run:"
echo "1. GTK+"
echo "2. SDL"
echo "3. VNC"
echo "4. SPICE"
echo "5. Curses"
echo "6. All Frontends"

read -p "Enter your choice: " choice

if [ $choice -eq 1 ]; then
  sudo apt-get install -y qemu-system-x86 qemu-kvm-extras-gtk
  qemu-system-x86 -vga std -enable-kvm
elif [ $choice -eq 2 ]; then
  sudo apt-get install -y qemu-system-x86 qemu-kvm-extras-sdl
  qemu-system-x86 -vga std -enable-kvm
elif [ $choice -eq 3 ]; then
  sudo apt-get install -y qemu-system-x86 qemu-kvm-extras-vnc
  qemu-system-x86 -vnc :0 -enable-kvm
elif [ $choice -eq 4 ]; then
  sudo apt-get install -y qemu-system-x86 qemu-kvm-extras-spice
  qemu-system-x86 -spice port=5900,addr=127.0.0.1,disable-ticketing -enable-kvm
elif [ $choice -eq 5 ]; then
  sudo apt-get install -y qemu-system-x86 qemu-kvm-extras-curses
  qemu-system-x86 -curses -enable-kvm
elif [ $choice -eq 6 ]; then
  sudo apt-get install -y qemu-system-x86 qemu-kvm-extras
  echo "Please choose a specific frontend to run"
else
  echo "Invalid choice. Please run the script again and select a valid option."
fi
