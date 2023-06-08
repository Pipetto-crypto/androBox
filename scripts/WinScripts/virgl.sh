#!/bin/bash

wine -k
sed -i "4s/=.*/=virgl/g" /sdcard/3in1ProotX86Emus/proot.conf
sed -i "11s/=.*/=virgl/g" /sdcard/3in1ProotX86Emus/box86opts
sed -i "12s/=.*/=swrast/g" /sdcard/3in1ProotX86Emus/box86opts
env GALLIUM_DRIVER=virpipe MESA_LOADER_DRIVER_OVERRIDE= winedesktop
