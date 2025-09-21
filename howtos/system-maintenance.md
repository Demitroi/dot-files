### System maintenance

These are my recommendations for system maintenance.

#### Btrfs snapshop

Before start doing maintenance, it's important to create a btrfs snapshot in case something breaks, you can rollback all the changes.

First create a mount point for the btrfs system.

```sh
sudo mkdir -p /mnt/btrfs
```

Mount the btrfs filesystem.

```sh
sudo mount /dev/mapper/root /mnt/btrfs
```

Change to the /mnt/btrfs directory.

```sh
cd /mnt/btrfs
```

Create a read-only snapshot.

```sh
sudo btrfs subvolume snapshot -r @ snapshots/@/$(date +%F_%H-%M-%S)
```

Leave the /mnt/btrfs directory and unmount the btrfs partition.

```sh
cd
sudo umount /mnt/btrfs
```

#### Upgrade the system

Perform a full system upgrade with pacman.

```sh
sudo pacman -Syu
```

#### Update the bootloader

Update the systemd-boot bootloader.

```sh
sudo bootctl update --efi-boot-option-description="Arch Linux"
```

#### Free up disk space

Over time, there are certain things in the system that take up disk space. However, there are several thigs to do in order to free up disk space.

Remove orphan packages.

```sh
pacman -Qdtq | sudo pacman -Rns -
```

Cleaning the pacman's cache it's not always a good idea, instead, only keep the latest 3 versions of installed packages.

Keep the latest 3 versions of installed packages.

```sh
sudo paccache -rk3
```

Remove cache of uninstalled packages.

```sh
sudo paccache -ruk0
```

Clean systemd journal, in the ```vacuum-time``` parameter the time time can be specified.

```sh
sudo journalctl --vacuum-time=90d
```

