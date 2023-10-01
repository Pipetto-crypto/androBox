#!/bin/bash

sed -i "4s/=.*/=llvmpipe/g" /sdcard/androBox/proot.conf
sed -i "/GALLIUM_DRIVER/d" /tmp/tmpvars.txt
sed -i "/MESA_LOADER_DRIVER_OVERRIDE/d" /tmp/tmpvars.txt
sed -i "/LIBGL_ALWAYS_SOFTWARE/d" /tmp/tmpvars.txt
cat >> /etc/profile.d/tmpvars.sh <<- EOM
GALLIUM_DRIVER=llvmpipe
MESA_LOADER_DRIVER_OVERRIDE=
EOM
/opt/WinScripts/restart.sh
