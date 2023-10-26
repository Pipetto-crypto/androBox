#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

kill -9 $(pgrep wine)
kill -9 $(pgrep wine64)
update-scripts
sleep 2
pfxupdate
sleep 3
winedesktop $@
