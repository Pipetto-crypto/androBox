#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

xterm -e $PREFIX/glibc/opt/WinScripts/winetricks.sh d3dcompiler_43
$PREFIX/glibc/opt/WinScripts/restart.sh
