#!/bin/bash
set -eu

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

stow_folders=$(find . -maxdepth 1 -type d -not \( -path "." -o -path "./.git" -o -path "./install" \) -print | sed 's|^\./||')

read -a selected_folders <<< $(echo -e $(printf "%s\n" "${stow_folders[@]}" | gum choose --no-limit --header "Stow Folders"))

for folder in "${selected_folders[@]}"; do

  if $dry_run; then
        gum log --time="TimeOnly" --level="debug" "[DRY RUN] stowing $folder"
        stow --simulate -v -R -t ~ $folder
    else
        gum log --time="TimeOnly" --level="info" "Running stow on $folder..."
        stow -v -R -t ~ $folder
    fi
done

