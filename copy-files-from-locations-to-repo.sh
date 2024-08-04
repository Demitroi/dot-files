#!/bin/sh

mkdir -p .config
mkdir -p .config/Code
mkdir -p .config/Code/User
mkdir -p .local
mkdir -p .local/share

cp -rf ~/.config/sway .config/
cp -rf ~/.config/foot .config/
cp -rf ~/.config/mako .config/
cp -rf ~/.config/screenshot .config/
cp -rf ~/.config/wofi .config/
cp -rf ~/.config/waybar .config/
cp -f ~/.zshrc .
cp -f ~/.vimrc .
cp -rf ~/.local/share/wallpapers .local/share/
cp -f ~/.config/Code/User/settings.json .config/Code/User
cp -f ~/.config/Code/User/keybindings.json .config/Code/User
cp -f ~/.config/code-flags.conf .config/
