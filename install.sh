#!/usr/bin/bash

set -e

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    brew install stow git curl gcc g++ make ripgrep
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    # Assume it is Ubuntu
    sudo apt update
    sudo apt install -y stow git curl gcc g++ make ripgrep xclip
    dotfile_dirs=$(ls -d */ | awk -F "/" '{ print $(NF-1) }')

    for dotfile_dir in $dotfile_dirs; do
        stow -D $dotfile_dir
        stow $dotfile_dir
    done
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
fi

stow .
