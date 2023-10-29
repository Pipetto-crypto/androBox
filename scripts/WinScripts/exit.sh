#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

sleep 4
kill -9 $(pgrep wine)
kill -9 $(pgrep wine64)
