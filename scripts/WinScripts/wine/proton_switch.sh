#!/bin/bash

unset WINEPREFIX
proton -k
sleep 3
wine -k
sleep 3
xterm -e wineswitch $1 $2
sleep 3
protondesktop
