#!/usr/bin/bash

sudo apt update
sudo apt install -y stow git curl gcc g++ make ripgrep

stow .
