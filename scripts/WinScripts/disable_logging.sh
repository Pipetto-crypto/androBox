#!/bin/bash

echo "Disabled" > $WINEPREFIX/islog
sed -i "/BOX86/d" /tmp/tmpvars.txt
sed -i "/BOX64/d" /tmp/tmpvars.txt
/opt/WinScripts/restart.sh
