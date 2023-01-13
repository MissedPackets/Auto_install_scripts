#!/bin/bash

# does the same as grep -rn ./ -e "keyword"
rg -n --no-ignore -e 'keyword' ./
