#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
taskset -c 1 sha1sum /dev/zero &

