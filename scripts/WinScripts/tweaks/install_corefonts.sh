#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

xterm -e $PREFIX/glibc/opt/WinScripts/winetricks.sh corefonts
$PREFIX/glibc/opt/WinScripts/restart.sh
