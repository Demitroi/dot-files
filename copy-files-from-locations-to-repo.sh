#!/bin/sh

mkdir -p .config
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
