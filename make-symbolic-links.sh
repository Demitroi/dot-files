#!/bin/sh

# Sway
mkdir -p ~/.config/sway
ln -s -f $PWD/.config/sway/config ~/.config/sway/

# Foot
mkdir -p ~/.config/foot
ln -s -f $PWD/.config/foot/foot.ini ~/.config/foot/

# Mako
mkdir -p ~/.config/mako
ln -s -f $PWD/.config/mako/config ~/.config/mako/

# Screenshot scripts
mkdir -p ~/.config/screenshot
ln -s -f $PWD/.config/screenshot/take_full_screenshot.sh mkdir ~/.config/screenshot/
ln -s -f $PWD/.config/screenshot/take_region_screenshot.sh ~/.config/screenshot/

# Wofi
mkdir -p ~/.config/wofi
ln -s -f $PWD/.config/wofi/config ~/.config/wofi/
ln -s -f $PWD/.config/wofi/style.css ~/.config/wofi/

# Waybar
mkdir -p ~/.config/waybar
ln -s -f $PWD/.config/waybar/config.jsonc ~/.config/waybar/
ln -s -f $PWD/.config/waybar/style.css ~/.config/waybar/

# Zsh
ln -s -f .zshrc ~/

# Wallpapers
mkdir -p ~/.local/share/wallpapers
ln -s -f $PWD/.local/share/wallpapers/1065712.jpg ~/.local/share/wallpapers/
ln -s -f $PWD/.local/share/wallpapers/ir-black.png ~/.local/share/wallpapers/
ln -s -f $PWD/.local/share/wallpapers/wallpaperflare.com_wallpaper.jpg ~/.local/share/wallpapers/

# VS Code
mkdir -p ~/.config/Code\ -\ OSS/User
ln -s -f $PWD/.config/Code\ -\ OSS/User/settings.json ~/.config/Code\ -\ OSS/User/
ln -s -f $PWD/.config/Code\ -\ OSS/User/keybindings.json ~/.config/Code\ -\ OSS/User/
ln -s -f $PWD/.config/code-flags.conf ~/.config/

# MPV
mkdir -p ~/.config/mpv
ln -s -f $PWD/.config/mpv/mpv.conf ~/.config/mpv/
