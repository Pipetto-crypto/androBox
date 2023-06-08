#!/bin/bash

wine -k
sed -i "4s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/proot.conf
sed -i "11s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/box86opts
sed -i "12s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/box86opts
env GALLIUM_DRIVER=zink MESA_LOADER_DRIVER_OVERRIDE=zink winedesktop
