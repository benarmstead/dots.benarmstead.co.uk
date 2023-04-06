#!/bin/bash
mkdir -p sway

# Define the array of folder names to copy
folders=(alacritty mpv newsboat rofi sway swaylock waybar)

# Loop through each folder in the array and copy it to the current working directory
for folder in "${folders[@]}"
do
  # Check if the folder exists in the ~/.config/ directory
  if [ -d ~/.config/"$folder" ]; then
    # If the folder is sway, copy only the config file
    if [ "$folder" == "sway" ]; then
      cp -r ~/.config/"$folder"/config ./sway/
      echo "Copied sway/config from ~/.config/ to current directory"
    else
      # For all other folders, copy the entire folder
      cp -r ~/.config/"$folder" ./
      echo "Copied $folder from ~/.config/ to current directory"
    fi
  else
    echo "$folder does not exist in ~/.config/"
  fi
done
