#!/bin/bash
set -eu

echo "Installing dependencies"

sudo apt update
sudo apt install -y git

echo "Instaling dependencies finished"

echo "Cloning .dotfiles repo"

git clone https://github.com/leoferreiralima/.dotfiles.git ~/.dotfiles

echo "Repo cloned"

cd ~/.dotfiles
