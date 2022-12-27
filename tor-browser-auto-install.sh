#!/bin/bash
gpg --refresh-keys
# curl https://www.torproject.org/download/ | grep linux

# curl https://www.torproject.org/download/ |grep -o -P '(?<=href).*(?=" download><span class="nick)'
var1=$(curl https://www.torproject.org/download/ |grep -o -P '(?<=href=").*(?=.asc" download><span class="nick)' | grep linux --color)
cd ~/Downloads
wget "https://www.torproject.org"$var1
# mv $var1 ~/Downloads
echo "Unzipping $var1"
tar xJf ~/Downloads/tor-browser-linux64*.tar.xz

rm -rf ~/Downloads/tor-browser-linux*.tar.xz
echo "Done installing Tor!"
echo "cd into tor-browser* && run ./start-tor-browser.desktop --register-app"
