#!/data/data/com.termux/files/usr/glibc/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
kill -9 $(pgrep wine)
winedesktop $@
