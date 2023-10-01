#!/bin/bash

sed -i "4s/=.*/=virgl/g" /sdcard/androBox/proot.conf
sed -i "/GALLIUM_DRIVER/d" /tmp/tmpvars.txt
sed -i "/MESA_LOADER_DRIVER_OVERRIDE/d" /tmp/tmpvars.txt
sed -i "/LIBGL_ALWAYS_SOFTWARE/d" /tmp/tmpvars.txt
cat >> /tmp/tmpvars.txt <<- EOM
GALLIUM_DRIVER=virpipe
MESA_LOADER_DRIVER_OVERRIDE=
LIBGL_ALWAYS_SOFTWARE=1
EOM
/opt/WinScripts/restart.sh
