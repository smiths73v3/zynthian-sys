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

Initial Zynthian GUI appears.

Go to admin menu

Select touch screen Navigation

Select **V5 Left** or **V5 Right** to get full ui w/buttons

### Allow UI to reboot

Long press **'i'** to bring up Admin menu if you misconfigure.

Select admin menu

