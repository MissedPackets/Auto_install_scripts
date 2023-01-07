#!/bin/bash
f=$(curl https://docs.docker.com/desktop/install/ubuntu/ |grep DEB |head -1| grep -o -P '(?<=href=").*(?=\?utm_source)')

echo "dl'ing: $f"

wget $f
