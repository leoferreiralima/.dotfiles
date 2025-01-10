#!/bin/bash
set -eu

source $(dirname $0)/install/install-font.sh
source $(dirname $0)/install/install-tools.sh
source $(dirname $0)/install/install-languages.sh

install_packages
#install_zsh()

install_zig

install_ghostty

install_font "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/RobotoMono.zip"

