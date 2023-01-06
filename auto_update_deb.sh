#!/bin/bash
echo $(apt list --upgradable|grep -o -zP '(\n).*(?=/)') | sed 's/^/sudo apt upgrade /' > 0_temp_auto_deb_install.txt


f=echo $(cat 0_temp_auto_deb_install.txt)

shred -uz 0_temp_auto_deb_install.txt

$f
