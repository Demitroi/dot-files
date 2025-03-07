### Demitroi's dot files

Software preferences and settings.

#### Wifi (NetworkManager)

NetworkManager is the standard Linux network configuration tool suite. It supports large range of networking setups, from desktop to servers and mobile and integrates well with popular desktop environments and server configuration management tools.

https://networkmanager.dev/

#### Time in multiple systems

If it's doing dual boot with windows it probably has problems with time, to avoid this, it's recommended to set the local rtc.

```sh
timedatectl set-local-rtc 1
```

See: https://wiki.archlinux.org/title/System_time#Multiple_systems

#### Display manager (ly)

TUI (ncurses-like) display manager for Linux and BSD. Supports X and Wayland sessions.

https://github.com/fairyglade/ly

Edit the file ```/etc/ly/config.ini``` and enable the big clock.

#### Window manager (Sway)
Sway (contracted from SirCmpwn's Wayland compositor [1]) is a compositor for Wayland designed to be fully compatible with i3.

Don't forget to install the ```sway-bg``` package.

https://swaywm.org/

Sway doesn't support proprietary drivers like Nvidia. In order to get Nvidia graphic working with sway it has to be run with ```--unsupported-gpu``` flag.

Edit the ```/usr/share/wayland-sessions/sway.desktop``` file and and the flag in the Exec section.

```sh
sudo vim nvim /usr/share/wayland-sessions/sway.desktop
```

For example.

```
[Desktop Entry]
Name=Sway
Comment=An i3-compatible Wayland compositor
Exec=sway --unsupported-gpu
Type=Application
```

See: https://wiki.archlinux.org/title/Sway, https://github.com/swaywm/sway/wiki

[.config/sway/config](.config/sway/config)

#### Statusbar (waybar)

Highly customizable Wayland bar for Sway and Wlroots based compositors.

https://github.com/Alexays/Waybar

See: https://github.com/Alexays/Waybar/wiki

[.config/waybar/config.jsonc](.config/waybar/config.jsonc)

[.config/waybar/style.css](.config/waybar/style.css)

#### Application launcher (Wofi)

Wofi is a launcher/menu program for wlroots based wayland compositors such as sway

Don't forget to install the ```otf-font-awesome``` and the ```ttf-font-awesome``` packages.

https://hg.sr.ht/~scoopta/wofi

[.config/wofi/config](.config/wofi/config)

[.config/wofi/style.css](.config/wofi/style.css)

#### Lock screen (Swaylock)

swaylock is a screen locking utility for Wayland compositors. It is compatible with any Wayland compositor which implements the ext-session-lock-v1 Wayland protocol.

[.config/sway/config](.config/sway/config)

#### Terminal Emulator (Foot)

Foot is a fast, lightweight and minimalistic Wayland terminal emulator.

Don't forget to install the ```ttf-hack-nerd``` and the ```noto-fonts-emoji``` packages.

https://codeberg.org/dnkl/foot

[.config/foot/foot.ini](.config/foot/foot.ini)

#### Shell (Zsh)

Zsh is a powerful shell that operates as both an interactive shell and as a scripting language interpreter. While being compatible with the POSIX sh (not by default, only if issuing emulate sh), it offers advantages such as improved tab completion and globbing.

Don't forget to install the ```zsh-completions``` package.

https://www.zsh.org/

See: https://wiki.archlinux.org/title/Zsh

[.zshrc](.zshrc)

#### Terminal text editor (Neovim)

Neovim is a fork of Vim aiming to improve the codebase, allowing for easier implementation of APIs, improved user experience and plugin implementation.

In order to install plugins first create de plugins directory and clone them there.

```sh
$ mkdir -p ~/.local/share/nvim/site/pack/plugins/start/
$ cd ~/.local/share/nvim/site/pack/plugins/start/
$ git clone my_plugin
```

Don't forget to install the ```ripgrep``` package.

https://neovim.io/

[.config/nvim/init.vim](.config/nvim/init.vim)

Plugins:
[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

#### Terminal multiplexer (Tmux)

tmux is a "terminal multiplexer: it enables a number of terminals (or windows), each running a separate program, to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached."

https://github.com/tmux/tmux/wiki

[.config/tmux/tmux.conf](.config/tmux/tmux.conf)

#### Clipboard manager (cliphist)

Wayland clipboard manager with support for multimedia.

Don't forget to install the ```wl-clipboard``` package.

https://github.com/sentriz/cliphist

#### Multimedia Server (PipeWire)

PipeWire is a new low-level multimedia framework. It aims to offer capture and playback for both audio and video with minimal latency and support for PulseAudio, JACK, ALSA and GStreamer-based applications.

Don't forget to install the ```pipewire-pulse``` and ```wireplumber``` package.

https://pipewire.org/

See: https://wiki.archlinux.org/title/PipeWire, https://wiki.archlinux.org/title/WirePlumber

#### Volume Control (PulseAudio Volume Control)

PulseAudio Volume Control (pavucontrol) is a simple GTK based volume control tool ("mixer") for the PulseAudio sound server. In contrast to classic mixer tools this one allows you to control both the volume of hardware devices and of each playback stream separately.

In order to use speakers and headphones in the same souncard the "Auto-Mute Mode" has to be disabled. Install the ```alsa-utils``` package and disable the auto mute in start up.

See: https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#Disabling_auto_mute_on_startup

https://freedesktop.org/software/pulseaudio/pavucontrol/

#### Graph/Patchbay for PipeWire (qpwgraph)

Qpwgraph is a graph manager dedicated to PipeWire, using the Qt C++ framework, based and pretty much like the same of QjackCtl.

Don't forget to install the ```qt5-wayland``` and ```qt6-wayland``` packages.

https://gitlab.freedesktop.org/rncbc/qpwgraph

#### Notifications (Mako)

A lightweight notification daemon for Wayland; it currently works on Sway and river.

Don't forget to install the ```libnotify``` package.

https://github.com/emersion/mako

#### Screencast

Install ```xdg-desktop-portal```, ```xdg-desktop-portal-wlr```, ```slurp```, ```wf-recorder``` in order to get Screencast working in firefox and obs. You can test screen cast here:

https://mozilla.github.io/webrtc-landing/gum_test.html

See: https://wiki.archlinux.org/title/PipeWire#WebRTC_screen_sharing

#### Screenshots (Grim and Slurp)

Grab images from a Wayland compositor.

https://sr.ht/~emersion/grim

Also instal slurp: Select a region in a Wayland compositor

https://github.com/emersion/slurp

Don't forget to install the ```wl-clipboard``` package.

See: https://wiki.archlinux.org/title/Screen_capture#Wayland

[.config/screenshot/take_full_screenshot.sh](.config/screenshot/take_full_screenshot.sh)

[.config/screenshot/take_region_screenshot.sh](.config/screenshot/take_region_screenshot.sh)

#### Screenshot editor (Swappy)

A Wayland native snapshot editing tool, inspired by Snappy on macOS.

https://github.com/jtheoof/swappy

#### File Manager (PCManFM-Qt)

File manager and desktop icon manager (Qt port of PCManFM and libfm).

https://github.com/lxqt/pcmanfm-qt

#### File archiver (LXQt Archiver)

A simple & lightweight desktop-agnostic Qt file archiver.

https://github.com/lxqt/lxqt-archiver

#### Image viewer (LXImage-Qt)

The image viewer and screenshot tool for lxqt.

https://github.com/lxqt/lximage-qt

#### Show calendar (khal)

CLI calendar application.

Don't forget to run ```khal configure`` to configure it.

https://github.com/pimutils/khal

#### Themes (breeze, breeze-gtk, bloom, qt6ct, lxqt-config-appearance)

Read this wiki entry for more context:

https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications

Install the themes breeze, breeze-gtk, papirus-icon-theme, deepin-icon-theme, ttf-hack-nerd and noto-fonts-emoji. Also you have to install qt6ct and lxqt-config to config graphically the qt and gtk themes.

Set the ```QT_QPA_PLATFORMTHEME=qt6ct``` and ```QT_QPA_PLATFORM=wayland``` enviroment variable globally by editing the file ```/etc/environment``` and then reboot.

```sh
$ sudo vim /etc/environment
$ sudo reboot
```

Open lxqt-config-appearance via terminal, in the Widget Style section select qt6ct-style in Qt Style combo box. In Icons Theme select Papirus-Dark, in Font section set the Font name to "Hack Nerd Font Mono", Style Normal and Point size 10, in Cursor select bloom and finally select Breeze-Dark in both GTK 3 and 4 Theme.

Open Qt6 Settings, select Breeze in Style, in Paletter check Custom radio button and select Color scheme darker. Go to Font tab, set the Font to "Hack Nerd Font Mono", Font style Normal and Size 10. Go to the Icon Theme tab and select Papirus-Dark.

#### Web Browser (Firefox)

Firefox is a popular open source graphical web browser from Mozilla.

https://www.mozilla.org/en-US/firefox/

See: https://wiki.archlinux.org/title/Firefox

Extensions:
- [Matte Black (Red)](https://addons.mozilla.org/en-US/firefox/addon/matte-black-red/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
- [Vimium](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

Customize toolbar. Right click tab bar, select customize toolbar and enable Title Bar.

Make it more efficient by enabling gfx.webrender.compositor.force-enabled in about:config.

https://www.reddit.com/r/swaywm/comments/1iuqclq/firefox_is_now_way_more_efficient_under_sway_it/

#### Audio Player (Audacious)

Audacious is a free and advanced audio player. It is focused on audio quality and supports a wide variety of audio codecs, and is easily extensible through third-party plugins.

https://audacious-media-player.org/

#### Video player (mpv)

mpv is a media player based on MPlayer and the now unmaintained mplayer2. It supports a wide variety of video file formats, audio and video codecs, and subtitle types. A detailed (although admittedly incomplete) list of differences between mpv and the aforementioned players can be found here. 

https://mpv.io/

#### Document viewer (XpdfReader)

Xpdf is a free PDF viewer and toolkit, including a text extractor, image converter, HTML converter, and more. Most of the tools are available as open source.

https://www.xpdfreader.com/

#### Office suite (Libre Office)

LibreOffice is the free power-packed Open Source personal productivity suite for Windows, Macintosh and Linux, that gives you six feature-rich applications for all your document production and data processing needs: Writer, Calc, Impress, Draw, Math and Base.

https://www.libreoffice.org/

In order to set the dark theme, see: https://wiki.archlinux.org/title/LibreOffice#LibreOffice_toolbars_unreadable_with_dark_Breeze/Plasma_5_theme

#### Calculator (Qalculate)

Qalculate! is a multi-purpose cross-platform desktop calculator. It is simple to use but provides power and versatility normally reserved for complicated math packages, as well as useful tools for everyday needs (such as currency conversion and percent calculation).

https://qalculate.github.io/

#### Audio editor and recorder (Audacity)

Audacity is an easy-to-use, multi-track audio editor and recorder for Windows, macOS, GNU/Linux and other operating systems.

https://www.audacityteam.org/

#### Monitor config

Edit sway dot files, check outputs with this command:

```sh
$ swaymsg -t get_outputs
```

See ```man 5 sway-output``` for more details.

[.config/sway/config](.config/sway/config)

#### Laptop Lid

To prevent the laptop from going into hibernation when the lid is closed, you have to configure ACPI events.

See:

https://wiki.archlinux.org/title/Power_management#ACPI_events

#### Mouse and Keyboard config

Edit sway dot files, check inputs with this command:

```sh
$ swaymsg -t get_inputs
```

See ```man 5 sway-input``` for more details.

[.config/sway/config](.config/sway/config)

#### Screen magnifier

It's not possible yet on sway, see:

https://www.reddit.com/r/swaywm/comments/15v29nf/does_a_swaywlroots_magnifying_glass_tool_exists/

https://github.com/swaywm/sway/issues/2781

#### Open Broadcaster Software

Open Broadcaster Software (OBS) is an open source cross-platform video recording and live-streaming application. It provides an easy to pick up and extensible workflow with customizable scenes, volume mixers, transitions, filters and more.

https://obsproject.com/

See: https://wiki.archlinux.org/title/Open_Broadcaster_Software

#### Font Manager

A simple font management application for GTK Desktop Environments.

https://github.com/FontManager/font-manager

#### Communication with Mobile Phone (KDE Connect)

Enabling communication between all your devices. Made for people like you.

https://kdeconnect.kde.org/

[.config/mako/config](.config/mako/config)

#### Code edition (Visual Studio Code)

Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications.

https://code.visualstudio.com/

Extensions:
- [Git Line Blame](https://marketplace.visualstudio.com/items?itemName=carlthome.git-line-blame)
- [GitHub Theme](https://marketplace.visualstudio.com/items?itemName=GitHub.github-vscode-theme)
- [Hex Editor](https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor)
- [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
- [vscode-base64](https://marketplace.visualstudio.com/items?itemName=adamhartford.vscode-base64)

[.config/Code/User/keybindings.json](.config/Code/User/keybindings.json)
[.config/Code/User/settings.json](.config/Code/User/settings.json)
[.config/code-flags.conf](.config/code-flags.conf)

#### Database manager (DBeaver)

DBeaver Community is a free cross-platform database tool for developers, database administrators, analysts, and everyone working with data.

https://dbeaver.io/

#### Flashcards (Anki)

Powerful, intelligent flash cards. Remembering things just became much easier.

https://apps.ankiweb.net/

#### Video Editor (Kdenlive)

Kdenlive is a powerful free and open source cross-platform video editing program made by the KDE community.

https://kdenlive.org/en/

#### Password manager (KeePassXC)

Let KeePassXC safely store your passwords and auto-fill them into your favorite apps, so you can forget all about them.

https://keepassxc.org/

#### Snapshots (Timeshift)

System restore tool for Linux. Creates filesystem snapshots using rsync+hardlinks, or BTRFS snapshots. Supports scheduled snapshots, multiple backup levels, and exclude filters. Snapshots can be restored while system is running or from Live CD/USB.

Don't forget to install the ```xorg-xwayland``` package.

https://github.com/linuxmint/timeshift

#### Icon manager (lxqt-config)

Tools to configure LXQt and the underlying operating system.

https://github.com/lxqt/lxqt-config

#### Mouse cursor (lxqt-config)

Tools to configure LXQt and the underlying operating system.

https://github.com/lxqt/lxqt-config

#### File associations config (lxqt-config)

Tools to configure LXQt and the underlying operating system.

https://github.com/lxqt/lxqt-config

#### Jellyfin (Multimedia servier)

Jellyfin is a free and open-source multimedia application suite designed to organize, manage, and share digital media files to networked devices.

https://wiki.archlinux.org/title/Jellyfin

#### File synchronization (Syncthing)

Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes. Your data is your data alone and you deserve to choose where it is stored, whether it is shared with some third party, and how it’s transmitted over the internet.

https://syncthing.net/

#### System information viewer (inxi)

inxi is a full featured CLI system information tool. It is available in most Linux distribution repositories, and does its best to support the BSDs. 

https://smxi.org/docs/inxi.htm

#### System resource monitor (btop)

Resource monitor that shows usage and stats for processor, memory, disks, network and processes.

https://github.com/aristocratos/btop

#### SSH Server (OpenSSH)

OpenSSH (OpenBSD Secure Shell) is a set of computer programs providing encrypted communication sessions over a computer network using the Secure Shell (SSH) protocol.

https://wiki.archlinux.org/title/OpenSSH

#### Monitoring SSDs y HDDs

Self-Monitoring, Analysis, and Reporting Technology (S.M.A.R.T., often written as SMART) is a monitoring system included in computer hard disk drives (HDDs) and solid-state drives (SSDs).[2] Its primary function is to detect and report various indicators of drive reliability with the intent of anticipating imminent hardware failures.

https://wiki.archlinux.org/title/S.M.A.R.T.

#### Mount and unmount pendrives (USB drive) (udisks)

udisks provides a daemon udisksd, that implements D-Bus interfaces used to query and manipulate storage devices, and a command-line tool udisksctl, used to query and use the daemon. 

https://www.freedesktop.org/wiki/Software/udisks/

For the root user, to list the drives user the following command:

```sh
$ fdisk -l
```

To mount the drives use:

```sh
$ sudo mount /dev/sdd1 /media/usb
```

To unmount the drives use:

```sh
$ sudo umount /dev/sdd1
```

For the normal user, to list the drives user the following command:

```sh
$ lsblk
```

To mount the drives use:

```sh
$ udisksctl mount -b /dev/sdd1
```

To unmount the drives use:

```sh
$ udisksctl unmount -b /dev/sdd1
```

See all mounts with:

```sh
findmnt
```

#### Format USB drives

Read how create a partition table and partitions in the wiki:

https://wiki.archlinux.org/title/Fdisk

In order to format read:

https://wiki.archlinux.org/title/FAT

#### Microcode

Processor manufacturers release stability and security updates to the processor microcode. These updates provide bug fixes that can be critical to the stability of your system. Without them, you may experience spurious crashes or unexpected system halts that can be difficult to track down. 

https://wiki.archlinux.org/title/Microcode

#### Touchpad (libinput)

libinput is a library to handle input devices in Wayland compositors and to provide a generic X.Org input driver. It provides device detection, device handling, input device event processing and abstraction to minimize the amount of custom input code compositors need to provide the common set of functionality that users expect.

https://wiki.archlinux.org/title/Libinput

See ```man 5 sway-input``` for more details.

[.config/sway/config](.config/sway/config)

#### Policy kit

Polkit is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes: It is a framework for centralizing the decision making process with respect to granting access to privileged operations for unprivileged applications.

https://github.com/lxqt/lxqt-policykit

[.config/sway/config](.config/sway/config)

#### Aditional packages

- alsa-utils
- anki
- breeze
- breeze-gtk
- brightnessctl
- btop
- cliphist
- cmatrix
- curl
- deepin-icon-theme
- dosfstools
- fastfetch
- ffmpeg
- font-manager
- git
- glow
- grim
- htop
- inxi
- jellyfin-server
- jellyfin-web
- jq
- keepassxc
- khal
- libinput
- libreoffice-still
- lsof
- lximage-qt
- lxqt-archiver
- lxqt-config
- lxqt-policykit
- mako
- man-db
- maven
- mpv
- neovim
- net-tools
- noto-fonts-emoji
- ntfs-3g
- open-ssh
- openssl
- otf-font-awesome
- p7zip
- papirus-icon-theme
- pavucontrol
- pcmanfm-qt
- playerctl
- qalculate-qt
- qpwgraph
- ripgrep
- rsync
- screenfetch
- sddm
- slurp
- smartmontools
- swappy
- syncthing
- tmux
- tree
- ttf-font-awesome
- ttf-hack-nerd
- udisks2
- unrar
- unzip
- usbutils
- uuid-gen
- vim
- visual-studio-code-bin
- vlc
- wf-recorder
- wl-clipboard
- xdg-desktop-portal
- xdg-desktop-portal-wlr
- xorg-xwayland
- xpdf
- yay
- zip
- zsh
- zsh-completions
