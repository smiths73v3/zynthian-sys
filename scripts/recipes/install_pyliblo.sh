#!/bin/bash

cd $ZYNTHIAN_SW_DIR

if [ -d "pyliblo" ]; then
	rm -rf pyliblo
fi

git clone https://github.com/dsacre/pyliblo.git
cd pyliblo
pip3 install .
cd ..

#--- Leave this around for now, so I can test the pyliblo install failure?
#-#rm -rf pyliblo
