#!/bin/bash

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Install of oh-my-zsh complete"

# Install zsh-autosuggestions plugin
echo "Installing zsh-autosuggestions plugin"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "Install of zsh-autosuggestions plugin complete"

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "Install of zsh-syntax-highlighting complete"


# Rename existing .gitconfig to .gitconfig_local when .gitconfig_local does not already exist
if [[ ! -e ~/.gitconfig_local ]]; then
    mv ~/.gitconfig ~/.gitconfig_local
    if [[ $? -eq 0 ]]; then
        echo "Moved ~/.gitconfig to ~/.gitconfig_local successfully"
    else
        echo "Failed to move ~/.gitconfig to ~/.gitconfig_local"
    fi
else
    echo "~/.gitconfig_local already exists"
fi

# Creating symbolic link to dotfiles .gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig
echo "Created symlink between ~/.gitconfig to $(pwd)/.gitconfig"

#[[ -e ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.backup
ln -s $(pwd)/zshrc ~/.zshrc
echo "Created symlink between ~/.zshrc to $(pwd)/.zshrc"

# Show app switcher on all monitors
echo "Enabling mac app switcher on all monitors..."
defaults write com.apple.Dock appswitcher-all-displays -bool true;
echo "reloading the dock..."
killall Dock
echo "Dock has been reloaded"

# Setup screenshots directory
echo "Configuring screenshots to be located in ~/screenshots"
mkdir -p ~/screenshots
defaults write com.apple.screencapture location ~/screenshots
echo "Restarting system server to apply changes..."
killall SystemUIServer
echo "Screenshots location has been set"