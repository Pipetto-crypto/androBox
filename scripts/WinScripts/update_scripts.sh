#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

$PREFIX/glibc/opt/WinScripts/exit.sh
source update-scripts
sleep 2
pfxupdate
sleep 3
$PREFIX/glibc/opt/WinScripts/restart.sh
