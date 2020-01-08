#!/bin/bash

# sosynth.sh
PLUGIN_DIR="So-synth-LV2-upstream-1.5"
cd $ZYNTHIAN_PLUGINS_SRC_DIR
if [ -d "$PLUGIN_DIR" ]; then
	rm -rf "$PLUGIN_DIR"
fi
#git clone https://github.com/jeremysalwen/So-synth-LV2
wget https://github.com/jeremysalwen/So-synth-LV2/archive/upstream/1.5.tar.gz
tar xfvz 1.5.tar.gz
rm -f 1.5.tar.gz
cd $PLUGIN_DIR 
sed -i -- 's/^INSTALLDIR = \$(DESTDIR)\/usr\/lib\/lv2\//INSTALLDIR = \/zynthian\/zynthian-plugins\/lv2\//' Makefile
make -j 2
make install
make clean
cd ..
rm -rf $PLUGIN_DIR
