#!/bin/bash

# Name of the file containing package names
filename="pkglist_aur.txt"

if [ ! -f "$filename" ]; then
  echo "File $filename not found."
  exit 1
fi

while IFS= read -r package; do
  echo "Installing package: $package"
  
  # Check if yay is available; otherwise, fall back to pacman
  if command -v yay &>/dev/null; then
    yay -S --noconfirm "$package"
  else
    sudo pacman -S --noconfirm "$package"
  fi
done < "$filename"
