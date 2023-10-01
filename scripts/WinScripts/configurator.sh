#!/bin/bash

openbox-session &
sleep 2
python3 /usr/bin/Configurator.py
pkill openbox
sleep 3
/opt/WinScripts/restart.sh

