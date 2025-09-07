### Rollback snapshots

In the situations where the system is unable to boot, the system can be recovered from a snapshot.

In this tutorial it'll be required an USB flash with the arch Linux installer.

https://wiki.archlinux.org/title/USB_flash_installation_medium

Boot in the live environment.

https://wiki.archlinux.org/title/Installation_guide#Boot_the_live_environment

#### Open the encrypted partition

The luks partition must be open before anything else.

Identify the luks partition by running the next command.

```sh
lsblk -f
```

Open the encrypted partition.

```sh
cryptsetup open /dev/sda3
```

Indentify the device mapper.

```sh
lsblk -f
```

Mount the btrfs partition.

```sh
mount /dev/mapper/root /mnt
```

Change to the mount directory.

```sh
cd /mnt
```

#### Create a snapshot of the current root subvolume

Once the live environment is ready and the luks partition is open and mounted, create a read-only snapshot of the current subvolume to keep a backup.

```sh
btrfs subvolume snapshot -r @ snapshots_broken/@/$(date +%F_%H-%M-%S)
```

#### Restore an old snapshot

First, remove the current ```@``` subvolume.

```sh
btrfs subvolume delete @
```

Create the subvolume ```@``` from an old working snapshot.

```sh
btrfs subvolume snapshot path_to_old_working_snapshot @
```

At this point, the system probably boots an works perfectly, if so, the rollback process can be finished here. But there's a strong possibility that the system is unable to mount partitions and use the kernel modules. This is because the kernel and the initramfs in the ```/boot``` partitions weren’t restored, and the versions of them versus the kernel packages installed under ```/usr/lib/modules/``` don’t match. If it's the case, follow the next steps.

#### Chroot to the root subvolume

In order to follow the next steps, first the ```@``` subvolume must be mounted, the mounts in the ```/etc/fstab``` file must be replicated and chroot into it.

Leave the ```/mnt``` directory.

```sh
cd
```

Mount the ```@``` subvolume.

```sh
mount -o noatime,subvol=@ /dev/mapper/root /mnt
```

Print the ```/etc/fstab``` file and replicate its mounts.

```sh
cat /mnt/etc/fstab
```

For example, the next fstab file.

```
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/mapper/root
UUID=b6c7770d-50e4-41ed-b332-1b1517a891cf	/         	btrfs     	rw,noatime,ssd,space_cache=v2,subvolid=256,subvol=/@	0 0

# /dev/mapper/root
UUID=b6c7770d-50e4-41ed-b332-1b1517a891cf	/home     	btrfs     	rw,noatime,ssd,space_cache=v2,subvolid=257,subvol=/@home	0 0

# /dev/mapper/root
UUID=b6c7770d-50e4-41ed-b332-1b1517a891cf       /var/log        btrfs           rw,noatime,ssd,space_cache=v2,subvolid=268,subvol=/@log 0 0

# /dev/sda1
UUID=33EB-D582      	/boot     	vfat      	rw,noatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro	0 2

# /dev/mapper/root
UUID=b6c7770d-50e4-41ed-b332-1b1517a891cf       /swap        btrfs           rw,noatime,ssd,space_cache=v2,subvolid=309,subvol=/@swap 0 0

# /swap/swapfile
/swap/swapfile	none      	swap      	defaults  	0 0
```

Can be replicated with the next commands.

```sh

mount -o noatime,subvol=@home /dev/mapper/root /mnt/home
mount -o noatime,subvol=@log /dev/mapper/root /mnt/var/log
mount -o noatime /dev/sda1 /mnt/boot
mount -o subvol=@swap /dev/mapper/root /mnt/swap
swapon /mnt/swap/swapfile
```

Chroot into the system.

```sh
arch-chroot /mnt
```

#### Downgrade the kernel

Downgrading the kernel regenerates the initramfs and replaces the vmlinuz image in the ```/boot``` partition, reinstalling the amd or intel ucode may also be necessary.

Check the installed versions in the system. The amd-ucode and intel-ucode must be installed according to the processor, to check run:

```sh
lscpu | grep -i model
```

Show the installed versions. If one of them isn't installed, dont' try to install it, for example, in some systems the headers could not be installed.

```sh
pacman -Q linux-lts linux-lts-headers amd-ucode intel-ucode
```

Install exact same versions from pacman's cache, for example:

```sh
pacman -U /var/cache/pacman/pkg/linux-lts-6.12.42-1-x86_64.pkg.tar.zst /var/cache/pacman/pkg/linux-lts-headers-6.12.42-1-x86_64.pkg.tar.zst /var/cache/pacman/pkg/amd-ucode-20250808-1-any.pkg.tar.zst
```

This will resintall the kernel in the ```@``` subolume, regenerate the initramfs and vmlinuz with in the ```/boot``` partition with the exact same version of ```/usr/lib/modules/```. And then, the system should work properly. Exit the chroot and reboot the machine.

#### Reinstall systemd-boot

If the system is unable to boot because the systemd-boot is broken or uninstalled, it has to be reinstalled. Follow the previous steps to chroot into the ```@``` partiton and continue in this point.


Reinstall the systemd-boot bootloader by running the next command:

```sh
bootctl install --efi-boot-option-description="Arch Linux"
```

In case the loader config file and the entries are missing, follow the ```Install the systemd-boot loader``` section in ```Arch linux installation``` page to recreate them.

#### Create a snapshot of the working system

Once the system is working, it's recommended to create a new snapshot in case de system breaks again. Follow the firsts steps to create a new snapshot.

Follow the first steps to mount the luks partition and the btrfs partition, then create a new read-only snapshot of the current subvolume to keep a backup.

```sh
btrfs subvolume snapshot -r @ snapshots/@/$(date +%F_%H-%M-%S)
```
