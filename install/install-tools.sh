#!/bin/bash

set -eu

apt install stow
apt install fzf
apt install tmux
apt install bat

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

