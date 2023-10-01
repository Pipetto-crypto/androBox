#!/bin/bash

echo "Enabled" > $WINEPREFIX/islog
cat >> /tmp/tmpvars.txt <<- EOM
BOX86_LOG=1
BOX64_LOG=1
BOX86_DYNAREC_LOG=1
BOX64_DYNAREC_LOG=1
EOM
/opt/WinScripts/restart.sh
