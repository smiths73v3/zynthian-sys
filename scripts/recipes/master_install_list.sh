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
#$ZYNTHIAN_RECIPE_DIR/install_jack2.sh

# Install modified Bluez from zynthian repo
#$ZYNTHIAN_RECIPE_DIR/install_bluez.sh

# Install pyliblo library (liblo OSC library for Python)
$ZYNTHIAN_RECIPE_DIR/install_pyliblo.sh

# Install mod-ttymidi (MOD's ttymidi version with jackd MIDI support)
#-#$ZYNTHIAN_RECIPE_DIR/install_mod-ttymidi.sh

# Install LV2 lilv library
$ZYNTHIAN_RECIPE_DIR/install_lv2_lilv.sh

# Install the LV2 C++ Tool Kit
$ZYNTHIAN_RECIPE_DIR/install_lvtk.sh
# => lvtk-1 failed
# TODO FAILED=> ninja: build stopped: subcommand failed.

# Install LV2 Jalv Plugin Host
$ZYNTHIAN_RECIPE_DIR/install_lv2_jalv.sh

# Install Aubio Library & Tools
$ZYNTHIAN_RECIPE_DIR/install_aubio.sh

# Install jpmidi (MID player for jack with transport sync)
#$ZYNTHIAN_RECIPE_DIR/install_jpmidi.sh
# TODO => No configure !! It must be changed to meson or waf or something like that....
# Do we need this? => I think no!!

# Install jack_capture (jackd audio recorder)
$ZYNTHIAN_RECIPE_DIR/install_jack_capture.sh

# Install jack_smf utils (jackd MID-file player/recorder)
$ZYNTHIAN_RECIPE_DIR/install_jack-smf-utils.sh

# Install touchosc2midi (TouchOSC Bridge)
$ZYNTHIAN_RECIPE_DIR/install_touchosc2midi.sh

# Install jackclient (jack-client python library)
#$ZYNTHIAN_RECIPE_DIR/install_jackclient-python.sh

# Install QMidiNet (MIDI over IP Multicast)
$ZYNTHIAN_RECIPE_DIR/install_qmidinet.sh

# Install jackrtpmidid (jack RTP-MIDI daemon)
$ZYNTHIAN_RECIPE_DIR/install_jackrtpmidid.sh

# Install the DX7 SysEx parser
$ZYNTHIAN_RECIPE_DIR/install_dxsyx.sh

# Install preset2lv2 (Convert native presets to LV2)
$ZYNTHIAN_RECIPE_DIR/install_preset2lv2.sh

# Install QJackCtl
#$ZYNTHIAN_RECIPE_DIR/install_qjackctl.sh

# Install patchage
$ZYNTHIAN_RECIPE_DIR/install_patchage.sh

# Install the njconnect Jack Graph Manager
$ZYNTHIAN_RECIPE_DIR/install_njconnect.sh

# Install Mutagen (when available, use pip3 install)
# $ZYNTHIAN_RECIPE_DIR/install_mutagen.sh

# Install VL53L0X library (Distance Sensor)
$ZYNTHIAN_RECIPE_DIR/install_VL53L0X.sh

# Install MCP4748 library (Analog Output / CV-OUT)
$ZYNTHIAN_RECIPE_DIR/install_MCP4728.sh

# Install noVNC web viewer
$ZYNTHIAN_RECIPE_DIR/install_noVNC.sh

# Install terminal emulator for tornado (webconf)
#$ZYNTHIAN_RECIPE_DIR/install_terminado.sh

# Install DT overlays for waveshare displays and others
#-#$ZYNTHIAN_RECIPE_DIR/install_waveshare-dtoverlays.sh

# Install web filebrowser
$ZYNTHIAN_RECIPE_DIR/install_filebrowser.sh
