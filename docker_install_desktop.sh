#!/bin/bash
r=curl https://docs.docker.com/desktop/install/ubuntu/ |grep DEB |head -1| grep -o -P '(?<=href=").*(?=" class="button primary-btn)'
curl -kLs --compressed "$r"