#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

sleep 3
kill -9 $(pgrep wine) >/dev/null 2>&1 
kill -9 $(pgrep wine64) >/dev/null 2>&1
