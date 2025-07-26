#!/bin/bash
#******************************************************************************
# ZYNTHIAN PROJECT: Zynthian Standalone Setup Script
# 
# Setup zynthian from scratch in a completely fresh minibian-jessie image.
# No need for nothing else. Only run the script twice, following the next
# instructions:
#
# 1. Run first time: sh ./setup_zynthian.sh
# 2. Reboot: It should reboot automaticly after step 1
# 3. Run second time: screen -t setup -L sh ./setup_zynthian.sh
# 4. Take a good beer, sit down and relax ... ;-)
# 
# Copyright (C) 2015-2024 Fernando Moyano <jofemodo@zynthian.org>
#
#******************************************************************************
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# For a full copy of the GNU General Public License see the LICENSE.txt file.
# 
#******************************************************************************
cd

set -x #enable command tracing
LOG_FILE="./setup_zynthian.log"

# Redirect all stdout and stderr to the log file
exec > >(tee -a "${LOG_FILE}") 2>&1

if uname -m | grep -qi x86_64; then
	echo "DietPi detected."
	echo "force wiggle to bypass rpi-config"
	echo 'date' > ~/.wiggled
	export IS_X86_64=true
else
	export IS_X86_64=false
fi

if [ "$1" = "wiggle" ] || [ ! -f ~/.wiggled ]; then
	echo `date` >  ~/.wiggled
	raspi-config --expand-rootfs
	reboot
else
	if [ ! -d "zynthian-sys" ]; then
		apt-get update
		apt-get -y install apt-utils git parted screen
		git clone -b NUC https://github.com/smiths73v3/zynthian-sys.git
	fi
	cd zynthian-sys/scripts
	if [ "$IS_X86_64" = "true" ]; then
		./setup_system_nuc_dietpi_64bit_bookworm.sh
	else
		./setup_system_raspiolite_64bit_bookworm.sh
	fi
	cd
	#-# don't remove the zynthian-sys from here for now, keep it in case I tweaked something for the install debug
	#-# rm -rf zynthian-sys
fi
