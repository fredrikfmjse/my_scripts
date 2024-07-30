#!/bin/bash

# Directory containing the scripts
script_dir=~/my_scripts

# Function to add alias to .zshrc if not already present
add_alias() {
    local script_name=$1
    local script_path="$script_dir/$script_name"
    local alias_command="alias ${script_name%.*}='$script_path'"
    
    if ! grep -qxF "$alias_command" ~/.zshrc; then
        echo "$alias_command" >> ~/.zshrc
        echo "Added alias for: $script_name"
    else
        echo "Alias already present for: $script_name"
    fi
}

# Add aliases for all scripts in the specified directory
for script_path in "$script_dir"/*.sh; do
    script_name=$(basename "$script_path")
    add_alias "$script_name"
done

# Source .zshrc to apply changes
source ~/.zshrc

echo "Aliases have been added and .zshrc has been sourced."

