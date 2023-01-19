#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Please provide a keyword as an argument"
  exit 1
fi

keyword=$1

# does the same as grep -rn ./ -e "keyword"
rg -n --no-ignore -e "$keyword" ./
