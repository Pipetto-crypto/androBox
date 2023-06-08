#!/bin/bash

echo "Disabled" > $WINEPREFIX/islog
/opt/WinScripts/box86/set_box86_log.sh 0
/opt/WinScripts/box86/set_box86_dyna_log.sh 0
/opt/WinScripts/restart.sh
