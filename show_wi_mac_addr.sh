#!/bin/bash
ip -br link | awk '/^w/{print $1 " " $3}'
#this shows the wireless interface and its mac address
