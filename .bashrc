#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls --color'
alias ls='ls --color=auto'
alias ll='ls -la --color'
alias open='xdg-open'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
PS1='[\u@\h \W]\$ '

# Set environment variables here
export QT_QPA_PLATFORMTHEME=gtk3
export QT_QPA_PLATFORM=wayland
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1
export ELECTRON_OZONE_PLATFORM_HINT=auto
export GTK_THEME=Adwaita:dark
export PAGER=less
export EDITOR=vim
export TERMINAL=foot
export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
export GTK_USE_PORTAL=1
export GDK_DEBUG=portals

# Start sway
# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
	gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	gsettings set org.gnome.desktop.interface cursor-theme 'bloom'
	gsettings set org.gnome.desktop.interface cursor-size 24
	exec sway --unsupported-gpu
fi
