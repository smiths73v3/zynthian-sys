# Zynthian Install amd64 Using Debian 13
## Obtain a Debian amd64 image, and burn to your install media
[Debian.org](https://www.debian.org/distrib/netinst)

### Boot into the Debian Install
Setup WiFi etc.
Set root password, and user account:
Login to machine after first boot:

### wait for bash login prompt
Install the basics to get the installer working:

```
apt install curl unzip
curl -L -O https://github.com/smiths73v3/zynthian-sys/archive/refs/heads/NUC.zip
unzip NUC.zip
./zynthian-sys-NUC/scripts/setup_zynthian.sh

```

## \-\~\=\[Full Zynthian Install Happens\]\=\~\-

On my vitrual machine, with 4 cores, this took 2+ Hours to complete.
There should be consistent progress show on thee terminal screen.
There will be multiple reboots.

## Finally the Initial Zynthian GUI appears.

Onscreen touch should work, and/or touchpad.

If touchpad does not move the cursor, then it is in "touchscreen mode"

In this case, imagine the touchpad areas overlaid on the screen.

Top left corner is "admin" menu. 

Long press **'i'** to bring up Admin menu, and arrows to navigate.
