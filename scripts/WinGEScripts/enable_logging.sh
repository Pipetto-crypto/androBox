#!/bin/bash

echo "Enabled" > $WINEPREFIX/islog
/opt/WinScripts/box86/set_box86_log.sh 1
/opt/WinScripts/box86/set_box86_dyna_log.sh 1
/opt/Win64Scripts/box64/set_box64_log.sh 1
/opt/Win64Scripts/box64/set_box64_dyna_log.sh 1
/opt/WinGEScripts/restart.sh
