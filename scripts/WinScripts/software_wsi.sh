#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

echo "MESA_VK_WSI_DEBUG=sw" >> /sdcard/androBox/uservars
$PREFIX/glibc/opt/WinScripts/restart.sh
