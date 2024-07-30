#!/bin/bash

# Check if Zsh is installed, if not install it
if ! command -v zsh &> /dev/null
then
    echo "Zsh not found. Installing Zsh..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update && sudo apt install -y zsh
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install zsh
    else
        echo "Unsupported OS. Please install Zsh manually."
        exit 1
    fi
else
    echo "Zsh is already installed."
fi

# Change the default shell to Zsh
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

echo "Default shell changed to Zsh and Oh My Zsh installed successfully."
