### Demitroi's dot files

Software preferences and settings.

#### Display manager (ly)

TUI (ncurses-like) display manager for Linux and BSD. Supports X and Wayland sessions.

https://github.com/fairyglade/ly

#### Window manager (Sway)
Sway (contracted from SirCmpwn's Wayland compositor [1]) is a compositor for Wayland designed to be fully compatible with i3.

https://swaywm.org/

See: https://wiki.archlinux.org/title/Sway, https://github.com/swaywm/sway/wiki

[.config/sway/config](.config/sway/config)

#### Shell (Zsh)

Zsh is a powerful shell that operates as both an interactive shell and as a scripting language interpreter. While being compatible with the POSIX sh (not by default, only if issuing emulate sh), it offers advantages such as improved tab completion and globbing.

https://www.zsh.org/

See: https://wiki.archlinux.org/title/Zsh

[.zshrc](.zshrc)

#### Audio editor and recorder (Audacity)

Audacity is an easy-to-use, multi-track audio editor and recorder for Windows, macOS, GNU/Linux and other operating systems.

https://www.audacityteam.org/

#### Audio Player (Audacious)

Audacious is a free and advanced audio player. It is focused on audio quality and supports a wide variety of audio codecs, and is easily extensible through third-party plugins.

https://audacious-media-player.org/

#### Web Browser (Firefox)

Firefox is a popular open source graphical web browser from Mozilla.

https://www.mozilla.org/en-US/firefox/

See: https://wiki.archlinux.org/title/Firefox

Extensions:
- [Matte Black (Red)](https://addons.mozilla.org/en-US/firefox/addon/matte-black-red/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)

#### Terminal Emulator (Foot)

Foot is a fast, lightweight and minimalistic Wayland terminal emulator.

https://codeberg.org/dnkl/foot

[.config/foot/foot.ini](.config/foot/foot.ini)

#### Open Broadcaster Software

Open Broadcaster Software (OBS) is an open source cross-platform video recording and live-streaming application. It provides an easy to pick up and extensible workflow with customizable scenes, volume mixers, transitions, filters and more.

https://obsproject.com/

See: https://wiki.archlinux.org/title/Open_Broadcaster_Software

#### Screen magnifier

It's not possible yet on sway, see:

https://www.reddit.com/r/swaywm/comments/15v29nf/does_a_swaywlroots_magnifying_glass_tool_exists/

https://github.com/swaywm/sway/issues/2781

#### Screenshots (Grim and Slurp)

Grab images from a Wayland compositor.

https://sr.ht/~emersion/grim

Also instal slurp: Select a region in a Wayland compositor

https://github.com/emersion/slurp

See: https://wiki.archlinux.org/title/Screen_capture#Wayland

[.config/screenshot/take_full_screenshot.sh](.config/screenshot/take_full_screenshot.sh)

[.config/screenshot/take_region_screenshot.sh](.config/screenshot/take_region_screenshot.sh)

#### Screenshot editor (Swappy)

A Wayland native snapshot editing tool, inspired by Snappy on macOS.

https://github.com/jtheoof/swappy

#### Screencast

Install xdg-desktop-portal, xdg-desktop-portal-wlr, slurp, wf-recorder in order to get Screencast working in firefox and obs. You can test screen cast here:

https://mozilla.github.io/webrtc-landing/gum_test.html

See: https://wiki.archlinux.org/title/PipeWire#WebRTC_screen_sharing

#### Audio Server (PipeWire)

PipeWire is a new low-level multimedia framework. It aims to offer capture and playback for both audio and video with minimal latency and support for PulseAudio, JACK, ALSA and GStreamer-based applications.

https://pipewire.org/

See: https://wiki.archlinux.org/title/PipeWire, https://wiki.archlinux.org/title/WirePlumber

#### Volume Control (PulseAudio Volume Control)

PulseAudio Volume Control (pavucontrol) is a simple GTK based volume control tool ("mixer") for the PulseAudio sound server. In contrast to classic mixer tools this one allows you to control both the volume of hardware devices and of each playback stream separately.

https://freedesktop.org/software/pulseaudio/pavucontrol/

#### Graph/Patchbay for PipeWire (qpwgraph)

Qpwgraph is a graph manager dedicated to PipeWire, using the Qt C++ framework, based and pretty much like the same of QjackCtl.

https://gitlab.freedesktop.org/rncbc/qpwgraph

#### Font Manager

A simple font management application for GTK Desktop Environments.

https://github.com/FontManager/font-manager

#### Application launcher (Wofi)

Wofi is a launcher/menu program for wlroots based wayland compositors such as sway

https://hg.sr.ht/~scoopta/wofi

[.config/wofi/config](.config/wofi/config)

[.config/wofi/style.css](.config/wofi/style.css)

#### Statusbar (waybar)

Highly customizable Wayland bar for Sway and Wlroots based compositors.

https://github.com/Alexays/Waybar

You must be a member of the input group to Keyboard State module. Don't forget reboot.

```sh
$ sudo usermod -aG input demitroi
```

See: https://github.com/Alexays/Waybar/wiki

[.config/waybar/config.jsonc](.config/waybar/config.jsonc)

[.config/waybar/style.css](.config/waybar/style.css)

#### Show calendar (khal)

CLI calendar application.

https://github.com/pimutils/khal

#### Clipboard manager (cliphist)

Wayland clipboard manager with support for multimedia.

https://github.com/sentriz/cliphist

#### Wifi (NetworkManager)

NetworkManager is the standard Linux network configuration tool suite. It supports large range of networking setups, from desktop to servers and mobile and integrates well with popular desktop environments and server configuration management tools.

https://networkmanager.dev/

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

Edit sway dot files, check outputs with this command:

```sh
$ swaymsg -t get_outputs
```

See ```man 5 sway-input``` for more details.

[.config/sway/config](.config/sway/config)

#### Communication with Mobile Phone (KDE Connect)

Enabling communication between all your devices. Made for people like you.

https://kdeconnect.kde.org/

#### Notifications (Mako)

A lightweight notification daemon for Wayland; it currently works on Sway and river.

https://github.com/emersion/mako

[.config/mako/config](.config/mako/config)

#### Lock screen (Swaylock)

swaylock is a screen locking utility for Wayland compositors. It is compatible with any Wayland compositor which implements the ext-session-lock-v1 Wayland protocol.

[.config/sway/config](.config/sway/config)

#### File Manager (PCManFM-Qt)

File manager and desktop icon manager (Qt port of PCManFM and libfm).

https://github.com/lxqt/pcmanfm-qt

#### File archiver (LXQt Archiver)

A simple & lightweight desktop-agnostic Qt file archiver.

https://github.com/lxqt/lxqt-archiver

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

#### Database manager (DBeaver)

DBeaver Community is a free cross-platform database tool for developers, database administrators, analysts, and everyone working with data.

https://dbeaver.io/

#### Flashcards (Anki)

Powerful, intelligent flash cards. Remembering things just became much easier.

https://apps.ankiweb.net/

#### Image viewer (LXImage-Qt)

The image viewer and screenshot tool for lxqt.

https://github.com/lxqt/lximage-qt

#### Video player (VLC)

VLC is a free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVD, Audio CD, VCD, and various streaming protocols.

https://www.videolan.org/vlc/

#### Video Editor (Kdenlive)

Kdenlive is a powerful free and open source cross-platform video editing program made by the KDE community.

https://kdenlive.org/en/

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

#### Password manager (KeePassXC)

Let KeePassXC safely store your passwords and auto-fill them into your favorite apps, so you can forget all about them.

https://keepassxc.org/

#### Snapshots (Timeshift)

System restore tool for Linux. Creates filesystem snapshots using rsync+hardlinks, or BTRFS snapshots. Supports scheduled snapshots, multiple backup levels, and exclude filters. Snapshots can be restored while system is running or from Live CD/USB.

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

#### DLNA Server (ReadyMedia (previously MiniDLNA) )

ReadyMedia (previously MiniDLNA) is server software with the aim of being fully compliant with DLNA/UPnP clients. The MiniDLNA daemon serves media files (music, pictures, and video) to clients on a network.

https://wiki.archlinux.org/title/ReadyMedia

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

#### Themes (breeze, breeze-gtk, bloom, qt6ct, lxqt-config-appearance)

Read this wiki entry for more context:

https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications

Install the themes breeze, breeze-gtk, papirus-icon-theme, deepin-icon-theme and ttf-hack-nerd. Also you have to install qt6ct and lxqt-config to config graphically the qt and gtk themes.

Set the ```QT_QPA_PLATFORMTHEME=qt6ct``` enviroment variable globally by editing the file ```/etc/environment``` and then reboot.

```sh
$ sudo vim /etc/environment
$ sudo reboot
```

Open lxqt-config-appearance via terminal, in the Widget Style section select qt6ct-style in Qt Style combo box. In Icons Theme select Papirus-Dark, in Font section set the Font name to "Hack Nerd Font Mono", Style Normal and Point size 10, in Cursor select bloom and finally select Breeze-Dark in both GTK 3 and 4 Theme.

Open Qt6 Settings, select Breeze in Style, in Paletter check Custom radio button and select Color scheme darker. Go to Font tab, set the Font to "Hack Nerd Font Mono", Font style Normal and Size 10. Go to the Icon Theme tab and select Papirus-Dark.


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

#### Aditional packages

- anki
- breeze
- breeze-gtk
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
- grim
- htop
- inxi
- jq
- keepassxc
- khal
- libreoffice-still
- lsof
- lximage-qt
- lxqt-archiver
- lxqt-config
- mako
- man-db
- minidlna
- net-tools
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
- rsync
- screenfetch
- sddm
- slurp
- smartmontools
- swappy
- syncthing
- tree
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
