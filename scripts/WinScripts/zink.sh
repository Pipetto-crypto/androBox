#!/bin/bash

sed -i "4s/=.*/=zink/g" /sdcard/androBox/proot.conf
sed -i "/GALLIUM_DRIVER/d" /tmp/tmpvars.txt
sed -i "/MESA_LOADER_DRIVER_OVERRIDE/d" /tmp/tmpvars.txt
sed -i "/LIBGL_ALWAYS_SOFTWARE/d" /tmp/tmpvars.txt
cat >> /tmp/tmpvars.txt <<- EOM
GALLIUM_DRIVER=zink
MESA_LOADER_DRIVER_OVERRIDE=zink
LIBGL_ALWAYS_SOFTWARE=0
EOM
/opt/WinScripts/restart.sh
