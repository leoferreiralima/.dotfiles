#!/bin/bash
set -eu

source $(dirname $0)/install/install-font.sh
source $(dirname $0)/install/install-tools.sh
source $(dirname $0)/install/install-languages.sh

if ! command -v gum >/dev/null 2>&1; then
  echo "Installing Gum"
  install_gum > /dev/null 2>&1
fi

dry_run=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --dry-run)
            dry_run=true
            shift
            ;;
        *)
            gum log --time="TimeOnly" --level="error" "Unknown option: $1"
            exit 1
            ;;
    esac
done

declare -A scripts=(
  ["packages"]="install_packages"
  ["zsh"]="install_zsh"
  ["tmux"]="install_tmux"
  ["zig"]="install_zig"
  ["ghostty"]="install_ghostty"
  ["zoxide"]="install_zoxide"
  ["nerd-font"]="install_font \"https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/RobotoMono.zip\""
)

scripts_name=(
  packages
  zsh
  tmux
  zig
  ghostty
  zoxide
  "nerd-font"
)

read -a selected_scripts <<< $(echo -e $(printf "%s\n" "${scripts_name[@]}" | gum choose --no-limit --header "Dotfiles Install"))

for script_name in "${selected_scripts[@]}"; do
  script=${scripts[$script_name]}

  if $dry_run; then
        gum log --time="TimeOnly" --level="debug" "[DRY RUN] $script"
    else
        gum log --time="TimeOnly" --level="info" "Running $script..."
        eval "$script"
    fi
done

