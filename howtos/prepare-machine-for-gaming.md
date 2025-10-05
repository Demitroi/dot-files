### Prepare machine for Gaming

Follow the next steps in order to prepare the machine for gaming.

#### Enable multilib repository

Edit the pacman config and uncomment the [multilib] section.

```sh
sudo vim /etc/pacman.conf
```

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Create a btrfs snapshot and upgrade the system, see the [System maitenance](howtos/system-maintenance.md) section.

#### Install graphics drivers

Install the graphics drivers according to machine's vendor, include the 32-bit application support.

- [AMDGPU](https://wiki.archlinux.org/title/AMDGPU)
- [Intel graphics](https://wiki.archlinux.org/title/Intel_graphics)
- [NVIDIA](https://wiki.archlinux.org/title/NVIDIA)

Install vulkan driver according to machine's gpu vendor, also include the 32-bit application support.

https://wiki.archlinux.org/title/Vulkan

Don't forget to install the icd loader because some graphic drivers don't install it.

- [vulkan-icd-loader](https://archlinux.org/packages/extra/x86_64/vulkan-icd-loader/)
- [lib32-vulkan-icd-loader](https://archlinux.org/packages/multilib/x86_64/lib32-vulkan-icd-loader/)

In order to see if it's working properly install the vulkaninfo command from the following package.

- [vulkan-tools](https://archlinux.org/packages/extra/x86_64/vulkan-tools/)

```sh
vulkaninfo
```

#### Install GE Proton

https://github.com/GloriousEggroll/proton-ge-custom

Compatibility tool for Steam Play based on Wine and additional components.

Go to project releases page and download the latest one.

https://github.com/GloriousEggroll/proton-ge-custom/releases

Make sure the compatibility tools directory exists. The directory is ```~/.steam/steam/compatibilitytools.d```, if it doesn't exist, install steam fist in order to create the directory.

Extract the tarbar into the directory.

```sh
tar -xvf GE-Proton*.tar.gz -C ~/.steam/steam/compatibilitytools.d/
```
