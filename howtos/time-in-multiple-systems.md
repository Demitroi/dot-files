### Time in multiple systems

If it's doing dual boot with windows it probably has problems with time, to avoid this, it's recommended to set the local rtc.

```sh
timedatectl set-local-rtc 1
```

See: https://wiki.archlinux.org/title/System_time#Multiple_systems
