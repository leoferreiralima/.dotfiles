#!/bin/bash
set -eu

install_gum () {
  GUM_DEB_URL=$(
  curl -s https://api.github.com/repos/charmbracelet/gum/releases/latest | \
    grep -oP "https://github.com/charmbracelet/gum/releases/download/[^\s/]+/gum_[^\s/_]+_amd64.deb"
  )

  GUM_DEB_FILE=$(basename "$GUM_DEB_URL")
  curl -LO "$GUM_DEB_URL"
  sudo dpkg -i "$GUM_DEB_FILE"
  rm "$GUM_DEB_FILE"
}

install_zsh () {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  curl -sS https://starship.rs/install.sh | sh

  #Plugins
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

install_packages () {
  sudo apt install -y \
  stow \
  fzf \
  stow \
  bat
}

install_ghostty () {
  source /etc/os-release
  GHOSTTY_DEB_URL=$(
  curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest | \
    grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_amd64_${VERSION_ID}.deb"
  )
  GHOSTTY_DEB_FILE=$(basename "$GHOSTTY_DEB_URL")
  curl -LO "$GHOSTTY_DEB_URL"
  sudo dpkg -i "$GHOSTTY_DEB_FILE"
  rm "$GHOSTTY_DEB_FILE"
}

install_zoxide() {
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
}

