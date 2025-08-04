# Zynthian Install x86_64 Using DietPi
## Obtain a DietPi image, and burn to your install media
[DietPi.com](https://dietpi.com)

### Boot into the DietPi
Login to machine after first boot:

**root:dietpi**

First question **0** opt out, **\<select\>**

Then pick keyboard layout

Set initial passwords

**opensynth**

Pick **go\-\>Install**

Pick **\<OK\>**

### wait for bash login prompt

```
$>wget https://github.com/smiths73v3/zynthian-sys/archive/refs/heads/NUC.zip

$>apt install unzip

$>unzip NUC.zip

$>./zynthian-sys-NUC/scripts/setup_zynthian.sh

```

## -~=[Full Zynthian Install Happens]=~-

Initial Zynthian GUI appears.

Go to admin menu

Select touch screen Navigation

Select **V5 Left** or **V5 Right** to get full ui w/buttons

### Allow UI to reboot

Long press **'i'** to bring up Admin menu if you misconfigure.

Select admin menu

