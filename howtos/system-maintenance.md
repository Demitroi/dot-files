### System maintenance

These are my recommendations for system maintenance.

#### Btrfs snapshop

Before start doing mantenance, it's important to create a btrfs snapshot in caused something breaks, you can rollback all the changes.

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

Remove previous ```@recovery``` subvolume if exists. To list the subvolumes run.

```sh
sudo btrfs subvolume list .
```

Make sure the ```@recovery``` subvolume is not mounted, deleting a mounted subvolume can lead to filesystem inconsistencies. The findmnt command shows the mounted btrfs subvolumes.

```sh
sudo findmnt
```

Delete the previous ```@recovery``` subvolume.

```sh
sudo btrfs subvolume delete @recovery
```

Create a new ```@recovery``` snapshot in case it's needed to boot on it. In this case it is not read-only.

```sh
sudo btrfs subvolume snapshot @ @recovery
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

#### Recover a broken system from a snapshot

In the situation in which the system can't boot due to a broken update or anything else. The ```@recovery``` subvolume can be used to boot and repair the system. To do that, in the grub boot menu, edit the entry with the ```e``` key. Look for the ```linux``` param and change the ```subvol=@``` param to ```subvol=@recovery```, then boot using the ```F10``` key. Once it booted on a working version, the ```@``` subvolume can be deleted or backed up, and the ```@recovery``` partition can be used to create a working ```@``` subvolume.

Whatever the case the steps are the next.

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

Back up the broken ```@``` subvolume, this step is not required but it's recommended.

```sh
sudo btrfs subvolume snapshot -r @ snapshots_broken/@/$(date +%F_%H-%M-%S)
```

Make sure the broken ```@``` subvolume is not mounted, deleting a mounted subvolume can lead to filesystem inconsistencies. The findmnt command shows the mounted btrfs subvolumes.

```sh
sudo findmnt
```

Delete the ```@``` subvolume.

```sh
sudo btrfs subvolume delete @
```

Create a snapshot with the name ```@``` from the ```@recovery``` subvolume or one of the snapshot list.

To see the snapshot list.

```sh
sudo btrfs subvolume list .
```

Create the new ```@``` subvolume from the selected snapshot, in this case the ```@recovery``` subvolume is used.

```sh
sudo btrfs subvolume snapshot @recovery @
```

Leave the /mnt/btrfs directory and unmount the btrfs partition.

```sh
cd
sudo umount /mnt/btrfs
```

Reboot the system and the boot will work properly.
