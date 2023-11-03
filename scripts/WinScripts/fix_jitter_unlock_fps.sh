#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

sed -i "s/fifo/mailbox/g" /sdcard/uservars.sh
$PREFIX/glibc/opt/WinScripts/restart.sh
