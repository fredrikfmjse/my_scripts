#!/bin/zsh

# Define an array of possible README filenames
readme_files=("README" "README.md" "README.txt" "README.rst" "readme" "readme.md" "readme.txt" "readme.rst")

# Loop through the array and check if any of the files exist
for file in "${readme_files[@]}"; do
  if [[ -f "$file" ]]; then
    echo "Opening $file..."
    vim "$file"
    exit 0
  fi
done

# If no README file is found
echo "No README file found in the current directory."

