#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Set environment variables here
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export JAVA_HOME=/usr/lib/jvm/java-21-temurin
export _JAVA_AWT_WM_NONREPARENTING=1
export ELECTRON_OZONE_PLATFORM_HINT=auto

# Start sway
# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu
