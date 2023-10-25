#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}

sed -i "/BOX86/d" $TMPDIR/tmpvars.txt
sed -i "/BOX64/d" $TMPDIR/tmpvars.txt

if [ -f $WINEPREFIX/islog ] && [ "$(cat $WINEPREFIX/islog)" == "Enabled" ]
then
     cat >> $TMPDIR/tmpvars.txt <<- EOM
     BOX86_LOG=1
     BOX64_LOG=1
     BOX86_DYNAREC_LOG=1
     BOX64_DYNAREC_LOG=1
     EOM
fi
$PREFIX/glibc/opt/WinScripts/restart.sh
