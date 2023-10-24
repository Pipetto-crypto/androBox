#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

echo "Disabled" > $WINEPREFIX/islog
sed -i "/BOX86/d" $TMPDIR/tmpvars.txt
sed -i "/BOX64/d" $TMPDIR/tmpvars.txt
$PREFIX/glibc/opt/WinScripts/restart.sh
