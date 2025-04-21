#### Mount and unmount external drives

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
