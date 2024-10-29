#!/bin/sh

mkdir -p .config
mkdir -p .config/Code\ -\ OSS
mkdir -p .config/Code\ -\ OSS/User
mkdir -p .local
mkdir -p .local/share
mkdir -p .config/mpv

cp -rf ~/.config/sway .config/
cp -rf ~/.config/foot .config/
cp -rf ~/.config/mako .config/
cp -rf ~/.config/screenshot .config/
cp -rf ~/.config/wofi .config/
cp -rf ~/.config/waybar .config/
cp -f ~/.zshrc .
cp -f ~/.vimrc .
cp -rf ~/.local/share/wallpapers .local/share/
cp -f ~/.config/Code\ -\ OSS/User/settings.json .config/Code\ -\ OSS/User/
cp -f ~/.config/Code\ -\ OSS/User/keybindings.json .config/Code\ -\ OSS/User/
cp -f ~/.config/code-flags.conf .config/
cp -f ~/.config/mpv/mpv.conf .config/mpv/
