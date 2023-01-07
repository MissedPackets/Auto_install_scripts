#!/bin/bash
ip -br link | awk '/^w/{print $1 " " $3}'
#this shows the machine name and its mac address
