## Demitroi's dot files

Software preferences and settings.

### Table of content

- [Base System](#base-system)
    - [Nvidia Drivers](#nvidia-drivers)
- [Desktop Environment](#desktop-environment)
    - [Window Manager](#window-manager)
    - [Fonts](#fonts)
    - [Qt Wayland](#qt-wayland)
    - [Statusbar](#statusbar)
    - [Application Launcher](#application-launcher)
    - [Lock Screen](#lock-screen)
    - [Terminal Emulator](#terminal-emulator)
    - [Shell](#shell)
    - [Clipboard Manager](#clipboard-manager)
    - [Multimedia Server](#multimedia-server)
    - [Volume Control](#volume-control)
    - [PipeWire Graph](#pipewire-graph)
    - [Brightness Control](#brightness-control)
    - [Wallpapers](#wallpapers)
    - [Notifications](#notifications)
    - [Screencasting](#screencasting)
    - [Screen Recorder](#screen-recorder)
    - [Screenshots](#screenshots)
    - [Screenshot editor](#screenshot-editor)
    - [File Manager](#file-manager)
    - [File Archiver](#file-archiver)
    - [Image Viewer](#image-viewer)
    - [Calendar](#calendar)
    - [Look and Feel](#look-and-feel)
    - [Display Settings](#display-settings)
    - [Screen magnifier](#screen-magnifier)
- [General Tools](#general-tools)
    - [Web Browser](#web-browser)
    - [Audio Player](#audio-player)
    - [Video Player](#video-player)
    - [Document Viewer](#document-viewer)
    - [Office Suite](#office-suite)
    - [Calculator](#calculator)
    - [Audio Editor and Recorder](#audio-editor-and-recorder)
    - [Recording and Broadcasting](#recording-and-broadcasting)
    - [Flashcards](#flashcards)
    - [Video Editor](#video-editor)
    - [Password Manager](#password-manager)
    - [System Information Tool](#system-information-tool)
    - [File Transferring and Synchronization](#file-transferring-and-synchronization)
    - [SSD and HDD Monitoring](#ssd-and-hdd-monitoring)
    - [Directory Tree Listing](#directory-tree-listing)
    - [Access and Manipulate Disks](#access-and-manipulate-disks)
    - [List Connected USB Devices](#list-connected-usb-devices)
- [Development tools](#development-tools)
    - [Terminal Text Editor](#terminal-text-editor)
    - [Terminal Multiplexer](#terminal-multiplexer)
    - [Code Editor](#code-editor)
    - [Database Manager](#database-manager)
    - [System Resource Monitor](#system-resource-monitor)
    - [Process Viewer](#process-viewer)
    - [API Tester](#api-tester)
    - [Version Control System](#version-control-system)
    - [Markdown Renderer](#markdown-renderer)
    - [JSON Processor](#json-processor)
    - [Open File Listing Tool](#open-file-listing-tool)
    - [Networking Utilities](#networking-utilities)
    - [DNS Utilities](#dns-utilities)
    - [TLS and SSL crypto library](#tls-and-ssl-crypto-library)
    - [Java Development](#java-development)
    - [JavaScript Development](#javascript-development)
    - [Go Development](#go-development)
- [Servers](#servers)
    - [Multimedia Server](#multimedia-server)
    - [File Synchronization](#file-synchronization)
    - [SSH Server](#ssh-server)
    - [Web Server](#web-server)
- [Gaming](#gaming)
    - [Linux application sandboxing](#linux-application-sandboxing)
    - [Video game preservation platform](#video-game-preservation-platform)
    - [Compatibility tools manager](#compatibility-tools-manager)
- [Howtos](#howtos)

### Base System

**Arch Linux**

https://archlinux.org/

My base system consists in a basic arch linux installation that uses btrfs filesystem, network manager, vim and man pages.

- [base](https://archlinux.org/packages/core/any/base/)
- [linux-lts](https://archlinux.org/packages/core/x86_64/linux-lts/)
- [linux-firmware](https://archlinux.org/packages/core/x86_64/linux-firmware/)
- [btrfs-progs](https://archlinux.org/packages/core/x86_64/btrfs-progs/)
- [sudo](https://archlinux.org/packages/core/x86_64/sudo/)
- [intel-ucode](https://archlinux.org/packages/extra/any/intel-ucode/)
- [amd-ucode](https://archlinux.org/packages/core/any/amd-ucode/)
- [networkmanager](https://archlinux.org/packages/extra/x86_64/networkmanager/)
- [vim](https://archlinux.org/packages/extra/x86_64/vim/)
- [man-db](https://archlinux.org/packages/core/x86_64/man-db/)
- [man-pages](https://archlinux.org/packages/core/x86_64/man-pages/)
- [texinfo](https://archlinux.org/packages/core/x86_64/texinfo/)
- [xdg-user-dirs](https://archlinux.org/packages/extra/x86_64/xdg-user-dirs/)
- [grub](https://archlinux.org/packages/core/x86_64/grub/)
- [efibootmgr](https://archlinux.org/packages/core/x86_64/efibootmgr/)
- [dosfstools](https://archlinux.org/packages/core/x86_64/dosfstools/)
- [ntfs-3g](https://archlinux.org/packages/extra/x86_64/ntfs-3g/)
- [pacman-contrib](https://archlinux.org/packages/extra/x86_64/pacman-contrib/)

Check out the [Arch Linux Installation](howtos/arch-linux-installation.md) for the full manual.

#### Nvidia Drivers

https://wiki.archlinux.org/title/NVIDIA

In case a Nvidia Graphic Card ins installed, the drivers must be installed, follow the arch linux wiki.

- [nvidia-open-dkms](https://archlinux.org/packages/extra/x86_64/nvidia-open-dkms/)

### Desktop Environment

#### Window Manager

**Sway**

https://swaywm.org/

Sway (contracted from SirCmpwn's Wayland compositor [1]) is a compositor for Wayland designed to be fully compatible with i3.

- [sway](https://archlinux.org/packages/extra/x86_64/sway/)
- [sway-bg](https://archlinux.org/packages/extra/x86_64/swaybg/)
- [xorg-xwayland](https://archlinux.org/packages/extra/x86_64/xorg-xwayland/)

[.config/sway/config](.config/sway/config)

#### Fonts

The following is the list of fonts that I use.

- [otf-font-awesome](https://archlinux.org/packages/extra/any/otf-font-awesome/)
- [ttf-font-awesome](https://archlinux.org/packages/extra/any/ttf-font-awesome/)
- [ttf-hack-nerd](https://archlinux.org/packages/extra/any/ttf-hack-nerd/)
- [noto-fonts-emoji](https://archlinux.org/packages/extra/any/noto-fonts-emoji/)

#### Qt Wayland

Some Apps like KeePassXC and qpwgraph requires the qt-wayland packages to work properly.

- [qt5-wayland](https://archlinux.org/packages/extra/x86_64/qt5-wayland/)
- [qt6-wayland](https://archlinux.org/packages/extra/x86_64/qt6-wayland/)

#### Statusbar

**Waybar**

https://github.com/Alexays/Waybar

Highly customizable Wayland bar for Sway and Wlroots based compositors.

- [waybar](https://archlinux.org/packages/extra/x86_64/waybar/)

[.config/waybar/config.jsonc](.config/waybar/config.jsonc)

[.config/waybar/style.css](.config/waybar/style.css)

#### Application Launcher

**Wofi**

https://hg.sr.ht/~scoopta/wofi

Wofi is a launcher/menu program for wlroots based wayland compositors such as sway.

- [wofi](https://archlinux.org/packages/extra/x86_64/wofi/)

[.config/wofi/config](.config/wofi/config)

[.config/wofi/style.css](.config/wofi/style.css)

#### Lock Screen

**Swaylock**

https://github.com/swaywm/swaylock

swaylock is a screen locking utility for Wayland compositors.

- [swaylock](https://archlinux.org/packages/extra/x86_64/swaylock/)

[.config/swaylock/config](.config/swaylock/config)

#### Terminal Emulator

**Foot**

https://codeberg.org/dnkl/foot

Foot is a fast, lightweight and minimalistic Wayland terminal emulator.

- [foot](https://archlinux.org/packages/extra/x86_64/foot/)

[.config/foot/foot.ini](.config/foot/foot.ini)

#### Shell

**Zsh**

https://www.zsh.org/

Zsh is a powerful shell that operates as both an interactive shell and as a scripting language interpreter.

- [zsh](https://archlinux.org/packages/extra/x86_64/zsh/)
- [zsh-completions](https://archlinux.org/packages/extra/any/zsh-completions/)

[.zshrc](.zshrc)

#### Clipboard Manager

**Cliphist**

https://github.com/sentriz/cliphist

Wayland clipboard manager with support for multimedia.

- [cliphist](https://archlinux.org/packages/extra/x86_64/cliphist/)
- [wl-clipboard](https://archlinux.org/packages/extra/x86_64/wl-clipboard/)
- [xdg-utils](https://archlinux.org/packages/extra/any/xdg-utils/)

#### Multimedia Server

**PipeWire**

https://pipewire.org/

PipeWire is a project that aims to greatly improve handling of audio and video under Linux.

- [pipewire](https://archlinux.org/packages/extra/x86_64/pipewire/)
- [pipewire-pulse](https://archlinux.org/packages/extra/x86_64/pipewire-pulse/)
- [wireplumber](https://archlinux.org/packages/extra/x86_64/wireplumber/)

#### Volume Control

**PulseAudio Volume Control**

https://freedesktop.org/software/pulseaudio/pavucontrol/

PulseAudio Volume Control (pavucontrol) is a simple GTK based volume control tool ("mixer") for the PulseAudio sound server.

- [pavucontrol](https://archlinux.org/packages/extra/x86_64/pavucontrol/)
- [alsa-utils](https://archlinux.org/packages/extra/x86_64/pavucontrol/)

In order to use speakers and headphones in the same sound card the "Auto-Mute Mode" has to be disabled. Exec ```alsamixer```, select the sound card and disable the Auto-Mute.

#### PipeWire Graph

**qpwgraph**

https://gitlab.freedesktop.org/rncbc/qpwgraph

Qpwgraph is a graph manager dedicated to PipeWire, using the Qt C++ framework, based and pretty much like the same of QjackCtl.

- [qpwgraph](https://archlinux.org/packages/extra/x86_64/qpwgraph/)

#### Brightness Control

**brightnessctl**

https://github.com/Hummer12007/brightnessctl

A program to read and control device brightness.

- [brightnessctl](https://archlinux.org/packages/extra/x86_64/brightnessctl/)

#### Wallpapers

**azote**

https://github.com/nwg-piotr/azote

Wallpaper manager for wlroots-based compositors and some other WMs.

- [azote](https://archlinux.org/packages/extra/any/azote/)

#### Notifications

**Mako**

https://github.com/emersion/mako

A lightweight notification daemon for Wayland. Works on Sway.

- [mako](https://archlinux.org/packages/extra/x86_64/mako/)
- [libnotify](https://archlinux.org/packages/extra/x86_64/libnotify/)

[.config/mako/config](.config/mako/config)

#### Screencasting

https://wiki.archlinux.org/title/Screen_capture#Wayland

https://wiki.archlinux.org/title/PipeWire#WebRTC_screen_sharing

The Screencasting in Wayland can be achieved by installing the following packages.

- [xdg-desktop-portal](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal/)
- [xdg-desktop-portal-wlr](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal-wlr/)
- [xdg-desktop-portal-gtk](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal-gtk/)
- [slurp](https://archlinux.org/packages/extra/x86_64/slurp/)

The Screencasting can be tested in the following page:

https://mozilla.github.io/webrtc-landing/gum_test.html

#### Screen Recorder

**wf-recorder**

https://archlinux.org/packages/extra/x86_64/wf-recorder/

wf-recorder is a utility program for screen recording of wlroots-based compositors (more specifically, those that support wlr-screencopy-v1 and xdg-output).

- [wf-recorder](https://archlinux.org/packages/extra/x86_64/wf-recorder/)

#### Screenshots

**grim**

https://gitlab.freedesktop.org/emersion/grim

Grab images from a Wayland compositor.

- [grim](https://archlinux.org/packages/extra/x86_64/grim/)

[.config/screenshot/take_full_screenshot.sh](.config/screenshot/take_full_screenshot.sh)

[.config/screenshot/take_region_screenshot.sh](.config/screenshot/take_region_screenshot.sh)

#### Screenshot editor

**swappy**

https://github.com/jtheoof/swappy

A Wayland native snapshot editing tool, inspired by Snappy on macOS.

- [swappy](https://archlinux.org/packages/extra/x86_64/swappy/)

#### File Manager

**PCManFM-Qt**

https://github.com/lxqt/pcmanfm-qt

File manager and desktop icon manager (Qt port of PCManFM and libfm).

- [pcmanfm-qt](https://archlinux.org/packages/extra/x86_64/pcmanfm-qt/)

[.config/pcmanfm-qt/default/settings.conf](.config/pcmanfm-qt/default/settings.conf)

#### File Archiver

**LXQt Archiver**

https://github.com/lxqt/lxqt-archiver

A simple & lightweight desktop-agnostic Qt file archiver.

- [lxqt-archiver](https://archlinux.org/packages/extra/x86_64/lxqt-archiver/)
- [zip](https://archlinux.org/packages/extra/x86_64/zip/)
- [unzip](https://archlinux.org/packages/extra/x86_64/unzip/)
- [unrar](https://archlinux.org/packages/extra/x86_64/unrar/)
- [7zip](https://archlinux.org/packages/extra/x86_64/7zip/)

[.config/lxqt/archiver.conf](.config/lxqt/archiver.conf)

#### Image Viewer

**LXImage-Qt**

https://github.com/lxqt/lximage-qt

The image viewer and screenshot tool for lxqt.

- [lximage-qt](https://archlinux.org/packages/extra/x86_64/lximage-qt/)

[.config/lximage-qt/settings.conf](.config/lximage-qt/settings.conf)

#### Calendar

**thunderbird**

https://www.thunderbird.net/en-US/

Thunderbird is an open source email, news, and chat client previously developed by the Mozilla Foundation. 

- [thunderbird](https://archlinux.org/packages/extra/x86_64/thunderbird/)

#### Look and Feel

GTK3 settings editor adapted to work in the wlroots environment.

- [gnome-themes-extra](https://archlinux.org/packages/extra/x86_64/gnome-themes-extra/)
- [papirus-icon-theme](https://archlinux.org/packages/extra/any/papirus-icon-theme/)
- [deepin-icon-theme](https://archlinux.org/packages/extra/any/deepin-icon-theme/)
- [qt5-base](https://archlinux.org/packages/extra/x86_64/qt5-base/)
- [qt6-base](https://archlinux.org/packages/extra/x86_64/qt6-base/)

[.config/gtk-3.0/settings.ini](.config/gtk-3.0/settings.ini)

[.gtkrc-2.0](.gtkrc-2.0)

[.icons/default/index.theme](.icons/default/index.theme)

[.config/xsettingsd/xsettingsd.conf](.config/xsettingsd/xsettingsd.conf)

[.bashrc](.bashrc)

#### Display Settings

**nwg-displays**

https://github.com/nwg-piotr/nwg-displays

Output management utility for sway and Hyprland.

- [nwg-displays](https://archlinux.org/packages/extra/any/nwg-displays/)

#### Screen Magnifier

It's not possible yet on sway, see:

https://www.reddit.com/r/swaywm/comments/15v29nf/does_a_swaywlroots_magnifying_glass_tool_exists/

https://github.com/swaywm/sway/issues/2781

### General Tools

#### Web Browser

**Firefox**

https://www.mozilla.org/en-US/firefox/

Firefox is a popular open source graphical web browser from Mozilla.

- [firefox](https://archlinux.org/packages/extra/x86_64/firefox/)

Install the following Extensions:

- [Matte Black (Red)](https://addons.mozilla.org/en-US/firefox/addon/matte-black-red/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
- [Vimium](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

Customize toolbar. Right click tab bar, select customize toolbar and enable Title Bar.

#### Audio Player

**Audacious**

https://audacious-media-player.org/

Audacious is a free and advanced audio player. It is focused on audio quality and supports a wide variety of audio codecs, and is easily extensible through third-party plugins.

- [audacious](https://archlinux.org/packages/extra/x86_64/audacious/)
- [playerctl](https://archlinux.org/packages/extra/x86_64/playerctl/)

#### Video Player

**mpv**

https://mpv.io/

mpv is a media player based on MPlayer and the now unmaintained mplayer2.

- [mpv](https://archlinux.org/packages/extra/x86_64/mpv/)

[.config/mpv/mpv.conf](.config/mpv/mpv.conf)

#### Document Viewer

**zathura**

https://pwmt.org/projects/zathura/

zathura is a customizable document viewer with vi-like keybindings. It provides a minimalistic and space-saving interface. Users interact with zathura primarily with the keyboard. Different file formats are supported through plugins.

- [zathura](https://archlinux.org/packages/extra/x86_64/zathura/)
- [zathura-pdf-mupdf](https://archlinux.org/packages/extra/x86_64/zathura-pdf-mupdf/)

[.config/zathura/zathurarc](.config/zathura/zathurarc)

#### Office Suite

**LibreOffice**

https://www.libreoffice.org/

LibreOffice is a private, free and open source office suite.

- [libreoffice-still](https://archlinux.org/packages/extra/x86_64/libreoffice-still/)
- [hunspell](https://archlinux.org/packages/extra/x86_64/hunspell/)
- [hunspell-en_us](https://archlinux.org/packages/extra/any/hunspell-en_us/)
- [hunspell-es_mx](https://archlinux.org/packages/extra/any/hunspell-es_mx/)

In order to set the Icons for the dark theme go to: Tools / Options, in the floating menu select LibreOffice / View, in the Icon Theme select Breeze (Dark).

#### Calculator

**Qalculate**

https://qalculate.github.io/

Qalculate! is a multi-purpose cross-platform desktop calculator.

- [qalculate-qt](https://archlinux.org/packages/extra/x86_64/qalculate-qt/)

#### Audio Editor and Recorder

**Audacity**

https://www.audacityteam.org/

Audacity is an easy-to-use, multi-track audio editor and recorder for Windows, macOS, GNU/Linux and other operating systems.

- [audacity](https://archlinux.org/packages/extra/x86_64/audacity/)

#### Recording and Broadcasting

**OBS Studio**

https://obsproject.com/

Open Broadcaster Software (OBS) is an open source cross-platform video recording and live-streaming application.

- [obs-studio](https://archlinux.org/packages/extra/x86_64/obs-studio/)

#### Flashcards

**Anki**

https://apps.ankiweb.net/

Anki is a flashcard program that helps you spend more time on challenging material, and less on what you already know.

- [anki-bin](https://aur.archlinux.org/packages/anki-bin)

#### Video Editor

**Kdenlive**

https://kdenlive.org/en/

Kdenlive is a powerful free and open source cross-platform video editing program made by the KDE community.

- [kdenlive](https://archlinux.org/packages/extra/x86_64/kdenlive/)

#### Password Manager

**KeePassXC**

https://keepassxc.org/

Let KeePassXC safely store your passwords and auto-fill them into your favorite apps, so you can forget all about them.

- [keepassxc](https://archlinux.org/packages/extra/x86_64/keepassxc/)

#### System Information Tool

**Fastfetch**

https://github.com/fastfetch-cli/fastfetch

Fastfetch is a neofetch-like tool for fetching system information and displaying it in a visually appealing way.

- [fastfetch](https://archlinux.org/packages/extra/x86_64/fastfetch/)

#### File Transferring and Synchronization

**rsync**

https://rsync.samba.org/

rsync is an open source utility that provides fast incremental file transfer.

- [rsync](https://archlinux.org/packages/extra/x86_64/rsync/)

#### SSD and HDD Monitoring

**Smartmontools**

https://www.smartmontools.org/

Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives.

- [smartmontools](https://archlinux.org/packages/extra/x86_64/smartmontools/)

#### Directory Tree Listing

**tree**

https://gitlab.com/OldManProgrammer/unix-tree

A directory listing program displaying a depth indented list of files.

- [tree](https://archlinux.org/packages/extra/x86_64/tree/)

#### Access and Manipulate Disks

**udisks**

https://www.freedesktop.org/wiki/Software/udisks/

Daemon, tools and libraries to access and manipulate disks, storage devices and technologies.

- [udisks2](https://archlinux.org/packages/extra/x86_64/udisks2/)

#### List Connected USB Devices

**usbutils**

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/

A collection of USB tools to query connected USB devices.

- [usbutils](https://archlinux.org/packages/core/x86_64/usbutils/)

### Development tools

#### Terminal Text Editor

**Neovim**

https://neovim.io/

Neovim is a fork of Vim aiming to improve the codebase, allowing for easier implementation of APIs, improved user experience and plugin implementation.

- [neovim](https://archlinux.org/packages/extra/x86_64/neovim/)
- [ripgrep](https://archlinux.org/packages/extra/x86_64/ripgrep/)

[.config/nvim/init.lua](.config/nvim/init.lua)

[.config/nvim/lazy-lock.json](.config/nvim/lazy-lock.json)

[.config/nvim/ftplugin/java.lua](.config/nvim/ftplugin/java.lua)

#### Terminal Multiplexer

**Tmux**

https://github.com/tmux/tmux/wiki

tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.

[.config/tmux/tmux.conf](.config/tmux/tmux.conf)

#### Code Editor

**Visual Studio Code**

https://code.visualstudio.com/

Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications.

- [code](https://archlinux.org/packages/extra/x86_64/code/)

Install the following Extensions:

- [Git Line Blame](https://marketplace.visualstudio.com/items?itemName=carlthome.git-line-blame)
- [GitHub Theme](https://marketplace.visualstudio.com/items?itemName=GitHub.github-vscode-theme)
- [Hex Editor](https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor)
- [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
- [vscode-base64](https://marketplace.visualstudio.com/items?itemName=adamhartford.vscode-base64)

[.config/Code - OSS/User/settings.json](.config/Code%20-%20OSS/User/settings.json)

[.config/Code - OSS/User/keybindings.json](.config/Code%20-%20OSS/User/keybindings.json)

[.config/code-flags.conf](.config/code-flags.conf)

#### Database Manager

**DBeaver**

https://dbeaver.io/

DBeaver Community is a free cross-platform database tool for developers, database administrators, analysts, and everyone working with data.

- [dbeaver](https://archlinux.org/packages/extra/x86_64/dbeaver/)

#### System Resource Monitor

**btop**

https://github.com/aristocratos/btop

A monitor of resources.

- [btop](https://archlinux.org/packages/extra/x86_64/btop/)

- [.config/btop/btop.conf](.config/btop/btop.conf)

#### Process Viewer

**htop**

https://htop.dev/

A cross-platform interactive process viewer.

- [htop](https://archlinux.org/packages/extra/x86_64/htop/)

#### API Tester

**curl**

https://curl.se/

Command line tool and library for transferring data with URLs.

- [curl](https://archlinux.org/packages/core/x86_64/curl/)

#### Version Control System

**Git**

https://git-scm.com/

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

- [git](https://archlinux.org/packages/extra/x86_64/git/)

[.gitconfig](.gitconfig)

#### Markdown Renderer

**Glow**

https://github.com/charmbracelet/glow

Command-line markdown renderer.

- [glow](https://archlinux.org/packages/extra/x86_64/glow/)

#### JSON Processor

**jq**

https://jqlang.org/

jq is a lightweight and flexible command-line JSON processor.

- [jq](https://archlinux.org/packages/extra/x86_64/jq/)

#### Open File Listing Tool

**lsof**

https://github.com/lsof-org/lsof

lsof is a command listing open files.

- [lsof](https://archlinux.org/packages/extra/x86_64/lsof/)

#### Networking Utilities

**net-tools**

https://net-tools.sourceforge.io/

net-tools, the collection of base networking utilities for Linux.

- [net-tools](https://archlinux.org/packages/core/x86_64/net-tools/)

#### DNS Utilities

**bind**

https://www.isc.org/bind/

A complete, highly portable implementation of the DNS protocol.

- [bind](https://archlinux.org/packages/extra/x86_64/bind/)

#### TLS and SSL crypto library

**OpenSSL**

https://www.openssl.org/

OpenSSL is a software library for applications that provide secure communications over computer networks against eavesdropping, and identify the party at the other end. It is widely used by Internet servers, including the majority of HTTPS websites.

- [openssl](https://archlinux.org/packages/core/x86_64/openssl/)

#### Java Development

Java is a programming language originally developed by Sun Microsystems and released in 1995 as a core component of Sun Microsystems' Java platform.

- [jdk21-openjdk](https://archlinux.org/packages/extra/x86_64/jdk21-openjdk/)
- [jdk8-openjdk](https://archlinux.org/packages/extra/x86_64/jdk8-openjdk/)
- [maven](https://archlinux.org/packages/extra/any/maven/)

#### JavaScript Development

JavaScript often abbreviated as JS, is a programming language and core technology of the World Wide Web, alongside HTML and CSS.

- [nodejs](https://archlinux.org/packages/extra/x86_64/nodejs/)
- [npm](https://archlinux.org/packages/extra/any/npm/)

#### Go Development

Go is an open source programming language supported by Google.

- [go](https://archlinux.org/packages/extra/x86_64/go/)

### Servers

#### Multimedia Server

**Jellyfin**

https://jellyfin.org/

Jellyfin is a free and open-source multimedia application suite designed to organize, manage, and share digital media files to networked devices.

- [jellyfin-server](https://archlinux.org/packages/extra/x86_64/jellyfin-server/)
- [jellyfin-web](https://archlinux.org/packages/extra/any/jellyfin-web/)

Enable and start the service.

```sh
systemctl enable jellyfin.service
systemctl start jellyfin.service
```

#### File Synchronization

**Syncthing**

https://syncthing.net/

Syncthing is a continuous file synchronization program.

- [syncthing](https://archlinux.org/packages/extra/x86_64/syncthing/)

Enable and start the service.

```sh
systemctl enable syncthing@myusername.service
systemctl start syncthing@myusername.service
```

#### SSH Server

**OpenSSH**

https://www.openssh.com/portable.html

SSH protocol implementation for remote login, command execution and file transfer.

- [openssh](https://archlinux.org/packages/core/x86_64/openssh/)

Enable and start the service.

```sh
systemctl enable sshd.service
systemctl start sshd.service
```

#### Web Server

**caddy**

https://caddyserver.com/

Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS.

- [caddy](https://archlinux.org/packages/extra/x86_64/caddy/)

### Gaming

All the games are installed using lutris, and lutris is installed via flatpak.

#### Linux application sandboxing

**Flatpak**

[https://flatpak.org/](https://flatpak.org/)

Flatpak is a system for building, distributing and running sandboxed desktop applications on Linux.

- [flatpak](https://archlinux.org/packages/extra/x86_64/flatpak/)

Add flathub repository.

```sh
$ flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

You may probably need to restart in order to see the flatpak apps in the application launcher.

#### Video game preservation platform

**Lutris**

[https://lutris.net/](https://lutris.net/)

Lutris is a video game preservation platform aiming to keep your video game collection up and running for the years to come.

- [Lutris](https://flathub.org/apps/net.lutris.Lutris)

```sh
$ flatpak install --user flathub net.lutris.Lutris
```

#### Compatibility tools manager

**ProtonPlus**

[https://protonplus.vysp3r.com/](https://protonplus.vysp3r.com/)

Install and manage Wine/Proton based compatibility tools with a graphical user interface.

- [ProtonPlus](https://flathub.org/apps/com.vysp3r.ProtonPlus)

```sh
$ flatpak install --user flathub com.vysp3r.ProtonPlus
```

### Howtos

Go to the [howtos](howtos/readme.md) section.

<!--
### My section

**Name of the tool I chose**

[url to the project](https://archlinux.org)

Long description of the tool.

- List
- of
- the
- packages
- needed

Aditional instructions for the package, e.g. execute the following command:

```sh
$ echo 'hello world'
```

[dot](dot)
[files](files)
[list](list)
-->
