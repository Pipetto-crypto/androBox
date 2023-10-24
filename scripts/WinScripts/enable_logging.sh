#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

echo "Enabled" > $WINEPREFIX/islog
cat >> $TMPDIR/tmpvars.txt <<- EOM
BOX86_LOG=1
BOX64_LOG=1
BOX86_DYNAREC_LOG=1
BOX64_DYNAREC_LOG=1
EOM
$PREFIX/glibc/opt/WinScripts/restart.sh
