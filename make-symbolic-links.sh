#!/bin/sh

# Sway
mkdir -p ~/.config/sway
ln -s -f $PWD/.config/sway/config ~/.config/sway/

# Swaylock
mkdir -p ~/.config/swaylock
ln -s -f $PWD/.config/swaylock/config ~/.config/swaylock/

# Foot
mkdir -p ~/.config/foot
ln -s -f $PWD/.config/foot/foot.ini ~/.config/foot/

# Mako
mkdir -p ~/.config/mako
ln -s -f $PWD/.config/mako/config ~/.config/mako/

# Screenshot scripts
mkdir -p ~/.config/screenshot
ln -s -f $PWD/.config/screenshot/take_full_screenshot.sh ~/.config/screenshot/
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
ln -s -f $PWD/.zshrc ~/

# Bash
ln -s -f $PWD/.bashrc ~/

# Wallpapers
mkdir -p ~/.local/share/wallpapers
ln -s -f $PWD/.local/share/wallpapers/1065712.jpg ~/.local/share/wallpapers/
ln -s -f $PWD/.local/share/wallpapers/ir-black.png ~/.local/share/wallpapers/
ln -s -f $PWD/.local/share/wallpapers/wallpaperflare.com_wallpaper.jpg ~/.local/share/wallpapers/
ln -s -f $PWD/.local/share/wallpapers/lock_screen1.png ~/.local/share/wallpapers/
ln -s -f $PWD/.local/share/wallpapers/lock_screen2.jpg ~/.local/share/wallpapers/

# VS Code
mkdir -p ~/.config/Code\ -\ OSS/User
ln -s -f $PWD/.config/Code\ -\ OSS/User/settings.json ~/.config/Code\ -\ OSS/User/
ln -s -f $PWD/.config/Code\ -\ OSS/User/keybindings.json ~/.config/Code\ -\ OSS/User/
ln -s -f $PWD/.config/code-flags.conf ~/.config/

# MPV
mkdir -p ~/.config/mpv
ln -s -f $PWD/.config/mpv/mpv.conf ~/.config/mpv/

# Git
ln -s -f $PWD/.gitconfig ~/

# Neovim
mkdir -p ~/.config/nvim/ftplugin
ln -s -f $PWD/.config/nvim/ftplugin/java.lua ~/.config/nvim/ftplugin/
ln -s -f $PWD/.config/nvim/init.lua ~/.config/nvim/
ln -s -f $PWD/.config/nvim/lazy-lock.json ~/.config/nvim/

# Tmux
mkdir -p ~/.config/tmux
ln -s -f $PWD/.config/tmux/tmux.conf ~/.config/tmux/

# mimeapps.list
ln -s -f $PWD/.config/mimeapps.list ~/.config/

# GTK 3 Settings
mkdir -p ~/.config/gtk-3.0
ln -s -f $PWD/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/

# GTK 2 Settings
ln -s -f $PWD/.gtkrc-2.0 ~/

# Icons Settings
mkdir -p ~/.icons/default
ln -s -f $PWD/.icons/default/index.theme ~/.icons/default/

# XSettingsd
mkdir -p ~/.config/xsettingsd
ln -s -f $PWD/.config/xsettingsd/xsettingsd.conf ~/.config/xsettingsd/

# nwg-bar
mkdir -p ~/.config/nwg-bar
ln -s -f $PWD/.config/nwg-bar/bar.json ~/.config/nwg-bar/
ln -s -f $PWD/.config/nwg-bar/style.css ~/.config/nwg-bar/

# PCManFM-Qt
mkdir -p ~/.config/pcmanfm-qt/default
ln -s -f $PWD/.config/pcmanfm-qt/default/settings.conf ~/.config/pcmanfm-qt/default/

# LXImage-Qt
mkdir -p ~/.config/lximage-qt
ln -s -f $PWD/.config/lximage-qt/settings.conf ~/.config/lximage-qt/

# LXQt File Archiver
mkdir -p ~/.config/lxqt
ln -s -f $PWD/.config/lxqt/archiver.conf ~/.config/lxqt/

# Zathura
mkdir -p ~/.config/zathura
ln -s -f $PWD/.config/zathura/zathurarc ~/.config/zathura/

# Btop
mkdir -p ~/.config/btop
ln -s -f $PWD/.config/btop/btop.conf ~/.config/btop/
