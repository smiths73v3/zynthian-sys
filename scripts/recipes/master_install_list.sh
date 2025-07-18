#!/bin/bash
#******************************************************************************
# ZYNTHIAN PROJECT: Zynthian Setup Script
# 
# Setup zynthian software recipes
# 
# Copyright (C) 2026 Steve Smith <smiths.73v3@gmail.com>
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

source "zynthian_envars_extended.sh"

#------------------------------------------------
# Build & Install Required Libraries
#------------------------------------------------

# Install Jack2
#./install_jack2.sh

# Install modified Bluez from zynthian repo
#./install_bluez.sh

# Install pyliblo library (liblo OSC library for Python)
./install_pyliblo.sh

# Install mod-ttymidi (MOD's ttymidi version with jackd MIDI support)
#-#./install_mod-ttymidi.sh

# Install LV2 lilv library
./install_lv2_lilv.sh

# Install the LV2 C++ Tool Kit
./install_lvtk.sh
# => lvtk-1 failed
# TODO FAILED=> ninja: build stopped: subcommand failed.

# Install LV2 Jalv Plugin Host
./install_lv2_jalv.sh

# Install Aubio Library & Tools
./install_aubio.sh

# Install jpmidi (MID player for jack with transport sync)
#./install_jpmidi.sh
# TODO => No configure !! It must be changed to meson or waf or something like that....
# Do we need this? => I think no!!

# Install jack_capture (jackd audio recorder)
./install_jack_capture.sh

# Install jack_smf utils (jackd MID-file player/recorder)
./install_jack-smf-utils.sh

# Install touchosc2midi (TouchOSC Bridge)
./install_touchosc2midi.sh

# Install jackclient (jack-client python library)
#./install_jackclient-python.sh

# Install QMidiNet (MIDI over IP Multicast)
./install_qmidinet.sh

# Install jackrtpmidid (jack RTP-MIDI daemon)
./install_jackrtpmidid.sh

# Install the DX7 SysEx parser
./install_dxsyx.sh

# Install preset2lv2 (Convert native presets to LV2)
./install_preset2lv2.sh

# Install QJackCtl
#./install_qjackctl.sh

# Install patchage
./install_patchage.sh

# Install the njconnect Jack Graph Manager
./install_njconnect.sh

# Install Mutagen (when available, use pip3 install)
# ./install_mutagen.sh

# Install VL53L0X library (Distance Sensor)
./install_VL53L0X.sh

# Install MCP4748 library (Analog Output / CV-OUT)
./install_MCP4728.sh

# Install noVNC web viewer
./install_noVNC.sh

# Install terminal emulator for tornado (webconf)
#./install_terminado.sh

# Install DT overlays for waveshare displays and others
#-#./install_waveshare-dtoverlays.sh

# Install web filebrowser
./install_filebrowser.sh
