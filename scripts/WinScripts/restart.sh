#!/data/data/com.termux/files/usr/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
kill -9 $(pgrep wine)
winedesktop >/dev/null 2>&1 &
