#!/bin/bash
#******************************************************************************
# ZYNTHIAN PROJECT: Zynthian Standalone Setup Script
# 
# Setup zynthian from scratch in a completely fresh minibian-jessie image.
# No need for nothing else. Only run the script twice, following the next
# instructions:
#
# 1. Run first time: sh ./setup_zynthian.sh
# 2. Reboot: It should reboot automaticly after step 1 (rPi only).
# 3. Run second time: screen -t setup -L sh ./setup_zynthian.sh
# 4. Take a good beer, sit down and relax ... ;-)
# 
# Pass the Base Git repository URL as first parameter if you want to use
# a different repository (for development purposes mainly) and the branch
# name as an optional second parameter.
# Example:
#     ./setup_zynthian.sh https://github.com/your-fork/ your-branch
#
# if the second parameter is omitted, the repo default branch will be used.
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
mkdir -p /zynthian
cd /zynthian

# write base_repo.sh if arguments were supplied
if [ $# -gt 0 ]; then
	echo "export ZYNTHIAN_BASE=${1:-https://github.com/zynthian}" > base_repo.sh
	if [ $# -gt 1 ]; then
		echo "export ZYNTHIAN_BRANCH=\"${2}\"" >> base_repo.sh
	else
		echo "export ZYNTHIAN_BRANCH=\"\"" >> base_repo.sh
	fi
fi

if [ -f base_repo.sh ]; then
	source base_repo.sh
else
	# default values
	ZYNTHIAN_BASE="https://github.com/zynthian"
	ZYNTHIAN_BRANCH=""
fi

# Helper function to return branch parameter
has_branch() {
	if [ -n "$1" ]; then
		echo "-b $1"
	fi
}


set -e #exit on error, so get it right!!!!!

set -x #enable command tracing
LOG_FILE="./setup_zynthian.log"

echogreen() {
	echo -e "\e[32m" $1 "\e[0m"
}

echogreen "Starting Zynthian Setup Script"

# Redirect all stdout and stderr to the log file appending for when we reboot etc.
exec > >(tee -a "${LOG_FILE}") 2>&1

if uname -m | grep -qi x86_64; then
	echo "x86_64 detected."
	export IS_X86_64=true
else
	export IS_X86_64=false
fi

if [ "$1" = "wiggle" ] || ([ ! -f ~/.wiggled ] && [ "$IS_X86_64" = "false" ]); then
	echo `date` > ~/.wiggled
	raspi-config --expand-rootfs
	reboot
	exit 0
fi

apt-get update
apt-get -q -y install apt-utils git parted screen

if [ ! -d "zynthian-sys" ]; then
	git clone $(has_branch ${ZYNTHIAN_BRANCH}) ${ZYNTHIAN_BASE}/zynthian-sys.git
else
	cd zynthian-sys
	git pull
	cd /zynthian
fi

cd zynthian-sys/scripts
if [ "$IS_X86_64" = "true" ]; then
	./setup_system_amd64_trixie.sh
else
	./setup_system_raspiolite_64bit_bookworm.sh
fi