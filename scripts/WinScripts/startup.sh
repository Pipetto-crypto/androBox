#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

if grep -q "services=disabled" $HOME/.androBox
then
     kill -9 "$(ps -aux | grep [s]ervices.exe | awk '{print $2}')"
fi
