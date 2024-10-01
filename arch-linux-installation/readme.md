### Arch linux installation

Arch linux installation using my personal preferences, for the official guide refer to: https://wiki.archlinux.org/title/Installation_guide

#### Prepare USB Stick

Download the image from this url: https://archlinux.org/download/

Find the usb stick by running the next command and make sure it's not mounted with ```lsblk```.

```sh
ls -l /dev/disk/by-id/usb-*
```

Output Example:

```
lrwxrwxrwx 1 root root  9 Oct  1 11:08 /dev/disk/by-id/usb-ADATA_USB_Flash_Drive_28B1915330860648-0:0 -> ../../sdb
lrwxrwxrwx 1 root root 10 Oct  1 11:08 /dev/disk/by-id/usb-ADATA_USB_Flash_Drive_28B1915330860648-0:0-part1 -> ../../sdb1
```

Run the next command replacing ```path/to/archlinux-version-x86_64.iso``` with the iso path and ```/dev/disk/by-id/usb-My_flash_drive``` with your usb drive, **DO NOT USE THE PARTITION NUMBER**.

```sh
dd bs=4M if=path/to/archlinux-version-x86_64.iso of=/dev/disk/by-id/usb-My_flash_drive conv=fsync oflag=direct status=progress
```

For example:

```sh
dd bs=4M if=/home/sergio/Downloads/archlinux-2024.10.01-x86_64.iso of=/dev/disk/by-id/usb-ADATA_USB_Flash_Drive_28B1915330860648-0:0 conv=fsync oflag=direct status=progress
```

#### Boot the live environment

Turn off the computer on which will be installed arch linux. Enter the BIOS an select the arch linux installation media.

Check this URL for a list of boot menu keys:

https://techofide.com/blogs/boot-menu-option-keys-for-all-computers-and-laptops-updated-list-2021-techofide/

#### Connect to the internet

If it's connected by ethernet, skip this step. For Wi-Fi user run ```iwctl```.

To list the Wi-Fi devices run the next command.

```sh
[iwd]# device list
```

It should list the devices, for example ```wlan0```.

The next step is to scan networks, run:

```sh
[iwd]# station wlan0 scan
```

List available networks:

```sh
[iwd]# station wlan0 get-networks
```

Connect to a network

```sh
[iwd]# station name connect SSID
```

Exit from iwctl and test the network

```sh
[iwd]# exit
```

```sh
ping google.com
```

#### Update the system clock

Run timedatectl to ensure the system clock is synchronized:

```sh
timedatectl
```

Set the timezone:

```sh
timedatectl set-timezone America/Tijuana
```

You can find the list of timezones in wikipedia:

https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

#### Partition the disks

First, identify the block devices, run:

```
fdisk -l
```

Output example:

```
Disk /dev/sda: 447.13 GiB, 480103981056 bytes, 937703088 sectors
Disk model: PNY CS1311 480GB
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: B9D5E312-5297-4155-961F-4A1FE1D12339

Device       Start       End   Sectors   Size Type
/dev/sda1     2048   1050623   1048576   512M EFI System
/dev/sda2  1050624 937701375 936650752 446.6G Linux filesystem


Disk /dev/sdb: 465.76 GiB, 500107862016 bytes, 976773168 sectors
Disk model: ST500LT012-1DG14
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: FE3316B8-B3AF-4416-96F6-7F42C41A5562

Device       Start       End   Sectors   Size Type
/dev/sdb1     2048   1050623   1048576   512M EFI System
/dev/sdb2  1050624 976771071 975720448 465.3G Microsoft basic data


Disk /dev/sdd: 3.61 GiB, 3879731200 bytes, 7577600 sectors
Disk model: USB Flash Drive 
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xf9f63ac3

Device     Boot   Start     End Sectors  Size Id Type
/dev/sdd1  *         64 1953791 1953728  954M  0 Empty
/dev/sdd2       1953792 2291711  337920  165M ef EFI (FAT-12/16/32)


Disk /dev/loop0: 794.42 MiB, 833007616 bytes, 1626968 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

The SSD or HDD can be identified by their models and sizes. In this case the installation drive will be ```PNY CS1311 480GB``` which is ```/dev/sda```.

Use fdisk to create the partitions.

```
fdisk /dev/sda
```

The 3 partitions suggested by the Arch installation guide are the next:

|Mount point on the installed system|Partition|Partition type|fisk partition type number|Suggested size|
|-|-|-|-|-|
|/boot|/dev/efi_system_partition|EFI system partition|1|1 GiB|
|[SWAP]|/dev/swap_partition|Linux swap|19|At least 4 GiB|
|/|/dev/root_partition|Linux x86-64 root (/)|23|Remainder of the device. At least 23–32 GiB.|

In fdisk you can list the known partition types by running the ```l``` command.

Create the GTP partition table and the partitions with the next commands:

```
Welcome to fdisk (util-linux 2.40.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): g
Created a new GPT disklabel (GUID: E583A9B4-E664-46D7-AB73-0AF69A4380BB).

Command (m for help): n
Partition number (1-128, default 1): 
First sector (2048-937703054, default 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-937703054, default 937701375): +1G

Created a new partition 1 of type 'Linux filesystem' and of size 1 GiB.
Partition #1 contains a vfat signature.

Do you want to remove the signature? [Y]es/[N]o: Y

The signature will be removed by a write command.

Command (m for help): t
Selected partition 1
Partition type or alias (type L to list all): 1
Changed type of partition 'Linux filesystem' to 'EFI System'.

Command (m for help): n
Partition number (2-128, default 2): 
First sector (2099200-937703054, default 2099200): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2099200-937703054, default 937701375): +4G

Created a new partition 2 of type 'Linux filesystem' and of size 4 GiB.

Command (m for help): t
Partition number (1,2, default 2): 2
Partition type or alias (type L to list all): 19

Changed type of partition 'Linux filesystem' to 'Linux swap'.

Command (m for help): n
Partition number (3-128, default 3): 
First sector (10487808-937703054, default 10487808): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (10487808-937703054, default 937701375): 

Created a new partition 3 of type 'Linux filesystem' and of size 442.1 GiB.

Command (m for help): t
Partition number (1-3, default 3): 3
Partition type or alias (type L to list all): 23

Changed type of partition 'Linux filesystem' to 'Linux root (x86-64)'.

Command (m for help): p
Disk /dev/sda: 447.13 GiB, 480103981056 bytes, 937703088 sectors
Disk model: PNY CS1311 480GB
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: E583A9B4-E664-46D7-AB73-0AF69A4380BB

Device        Start       End   Sectors   Size Type
/dev/sda1      2048   2099199   2097152     1G EFI System
/dev/sda2   2099200  10487807   8388608     4G Linux swap
/dev/sda3  10487808 937701375 927213568 442.1G Linux root (x86-64)

Filesystem/RAID signature on partition 1 will be wiped.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

#### Encrypt root partition

Only the ```/dev/sda3``` partition will be encrypted. Run the next command.

```sh
cryptsetup luksFormat /dev/sda3
```

Enter YES and write a passphrase. Output Example:

```
WARNING!
========
This will overwrite data on /dev/sda3 irrevocably.

Are you sure? (Type 'yes' in capital letters): YES
Enter passphrase for /dev/sda3: 
Verify passphrase: 
cryptsetup luksFormat /dev/sda3  19.69s user 0.36s system 84% cpu 23.678 total
```

Open the encrypted partition with the following command:

```sh
cryptsetup luksOpen /dev/sda3 root
```

Once the encrypted partition is open, you can see it with the ```lsblk``` command.

```
NAME     MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
loop0      7:0    0 794.4M  1 loop  /run/archiso/airootfs
sda        8:0    0 447.1G  0 disk  
├─sda1     8:1    0     1G  0 part  
├─sda2     8:2    0     4G  0 part  
└─sda3     8:3    0 442.1G  0 part  
  └─root 254:0    0 442.1G  0 crypt 
sdb        8:16   0 465.8G  0 disk  
├─sdb1     8:17   0   512M  0 part  
└─sdb2     8:18   0 465.3G  0 part  
sdc        8:32   1     0B  0 disk  
sdd        8:48   1   3.6G  0 disk  
├─sdd1     8:49   1   954M  0 part  
└─sdd2     8:50   1   165M  0 part  
```

#### Format partitions

Format the EFI partition.

```sh
mkfs.fat -F 32 /dev/sda1
```

Format the SWAP partition.

```sh
mkswap /dev/sda2
```

The root partition must be formatted using the mapper.

```sh
mkfs.btrfs /dev/mapper/root
```

Output example:

```
btrfs-progs v6.10.1
See https://btrfs.readthedocs.io for more information.

Performing full device TRIM /dev/mapper/root (442.11GiB) ...
NOTE: several default settings have changed in version 5.15, please make sure
      this does not affect your deployments:
      - DUP for metadata (-m dup)
      - enabled no-holes (-O no-holes)
      - enabled free-space-tree (-R free-space-tree)

Label:              (null)
UUID:               b6c7770d-50e4-41ed-b332-1b1517a891cf
Node size:          16384
Sector size:        4096        (CPU page size: 4096)
Filesystem size:    442.11GiB
Block group profiles:
  Data:             single            8.00MiB
  Metadata:         DUP               1.00GiB
  System:           DUP               8.00MiB
SSD detected:       yes
Zoned device:       no
Features:           extref, skinny-metadata, no-holes, free-space-tree
Checksum:           crc32c
Number of devices:  1
Devices:
   ID        SIZE  PATH            
    1   442.11GiB  /dev/mapper/root
```

#### Btrfs subvolumes

Mount ```/dev/mapper/root``` before creating subvolumes.

```sh
mount /dev/mapper/root /mnt
```

Change to the ```/mnt``` directory.

```sh
cd /mnt
```

Create the root and home subvolumes.

```sh
btrfs subvolume create @
btrfs subvolume create @home
```

Exit from the ```/mnt``` directory and unoumnt it.

```sh
cd
umount /mnt
```

#### Mount the filesystems

Previously the subvolumes root and home were created, now they need to be mounted.

First mount the root subvolume.

```sh
mount -o noatime,subvol=@ /dev/mapper/root /mnt
```

Create the home directory and mount the home subvolume.

```sh
mkdir /mnt/home
mount -o noatime,subvol=@home /dev/mapper/root /mnt/home
```

Create boot directory and mount the boot partition.

```sh
mkdir /mnt/boot
mount -o noatime /dev/sda1 /mnt/boot
```

Enable swap by running the next command:

```sh
swapon /dev/sda2
```

#### Select the mirrors

Select the mirrors of your contry using the next command:

```sh
reflector --country Mexico --latest 5 --age 12 --sort rate --save /etc/pacman.d/mirrorlist
```

#### Install essencial packages

Install essencial packages by running the next command, remember to change intel-ucode to amd-ucode in case the computer has and amd processor.

```sh
pacstrap -K /mnt base linux-lts linux-firmware btrfs-progs sudo intel-ucode networkmanager vim man-db man-pages texinfo
```

#### Configure the system

Generate the fstab file.

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

Change root into the new system.

```sh
arch-chroot /mnt
```

Set the timezone.

```sh
ln -sf /usr/share/zoneinfo/America/Tijuana /etc/localtime
```

Run hwclock(8) to generate /etc/adjtime

```sh
hwclock --systohc
```

In order to configure localization, edit ```/etc/locale.gen``` and uncomment ```en_US.UTF-8 UTF-8``` and execute the next:

```sh
locale-gen
```

Create the locale.conf file.

```sh
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

Create the hostname file.

```sh
echo toshiba > /etc/hostname
```

#### Initramfs

Edit the ```/etc/mkinitcpio.conf``` file and add the encrypt hook.

```sh
vim /etc/mkinitcpio.conf
```

Make sure the ```encrypt``` hook is before ```filesystems``` hook.

```
HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt filesystems fsck)
```

Then recreate the initramfs image.

```sh
mkinitcpio -P
```

Set the root password.

```sh
passwd
```

#### (Optional) Create a user

Create a user with home directory and add it to the group wheel.

```sh
useradd --create-home --groups wheel demitroi
```

Set new password for the user.

```sh
passwd demitroi
```

Add the new user to the sudoers.

```sh
echo "demitroi ALL=(ALL:ALL) ALL" > /etc/sudoers.d/demitroi
```

#### Install Boot loader

Install the ```grub``` and ```efibootmgr``` packages.

```sh
pacman -S grub efibootmgr
```

Install the grub bootloader by running the next command:

```sh
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

Generate grub configuration.

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

Configure cryptdevice in grub. Use blkid to get the partition id.

```sh
blkid /dev/sda3
```

Output example:

```
/dev/sda3: UUID="8f0d30d4-1be6-4f7e-b9c1-4c4349cbdffd" TYPE="crypto_LUKS" PARTUUID="c293c947-881e-440c-b85c-859f19391b96"
```

Copy the uuid and edit the ```/etc/default/grub``` file.

```sh
vim /etc/default/grub
```

Edit the ```GRUB_CMDLINE_LINUX_DEFAULT``` line and add the cryptdevice and root parameter, for example:

```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet cryptdevice=UUID=8f0d30d4-1be6-4f7e-b9c1-4c4349cbdffd:root root=/dev/mapper/root"
```

Save the file and generate grub configuration.

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

For more information refer to https://wiki.archlinux.org/title/Dm-crypt/System_configuration#Kernel_parameters

#### Post installation

Enable and start NetworkManager.

```sh
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
```

It's recommended to see the next URL: https://wiki.archlinux.org/title/General_recommendations

You can see my main readme for mor of my personal preferences

[readme.md](/readme.md)
