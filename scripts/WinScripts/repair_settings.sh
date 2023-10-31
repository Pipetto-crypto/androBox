#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cat > $HOME/.androBox <<- EOM
#androBox configuration file

checkres=enabled
services=enabled
EOM
