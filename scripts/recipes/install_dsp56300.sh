#!/bin/bash

cd $ZYNTHIAN_PLUGINS_SRC_DIR

if [ -d "gearmulator" ]; then
    #-#rm -rf "gearmulator"
    #-#git clone --recurse-submodules https://github.com/dsp56300/gearmulator.git
else
    git clone --recurse-submodules https://github.com/smiths73v3/gearmulator.git
fi

cd gearmulator
#-# Pull latest changes, and update submodules
git pull
git submodule update --init --recursive
umount /tmp
cmake --fresh
cmake --preset zynthian_x86_64
cmake --build --preset zynthian_x86_64 --target install
mount /tmp

mv /usr/local/virusTestConsole /usr/local/bin
mv /usr/local/start_IndiArp_BC.sh /usr/local/bin
mv /usr/local/start_Impact__MS.sh /usr/local/bin

# Copy ROM files and then ...
#jalv http://theusualsuspects.lv2.Osirus
#jalv http://theusualsuspects.lv2.OsTIrus
#regenerate_lv2_presets.sh http://theusualsuspects.lv2.Osirus
#regenerate_lv2_presets.sh http://theusualsuspects.lv2.OsTIrus

cd ..
#-#rm -rf "gearmulator"
