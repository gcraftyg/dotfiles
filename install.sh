#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Rename existing .gitconfig to .gitconfig_local when .gitconfig_local does not already exist
[[ ! -e ~/.gitconfig_local ]] && mv ~/.gitconfig ~/.gitconfig_local
ln -s $(pwd)/gitconfig ~/.gitconfig

[[ -e ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.backup
ln -s $(pwd)/zshrc ~/.zshrc