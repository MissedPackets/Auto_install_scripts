#!/bin/bash
git clone --recursive http://github.com/ardagnir/athame
cd athame
./readline_athame_setup.sh --libdir=/lib/x86_64-linux-gnu --use_sudo --vimbin=$(which nvim)

./bash_readline_setup.sh --use_sudo --vimbin=$(which nvim)
