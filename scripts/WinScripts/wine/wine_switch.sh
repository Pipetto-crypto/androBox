#!/bin/bash

unset WINEPREFIX
wine -k
sleep 3
proton -k
sleep 3
xterm -e wineswitch $1 $2 
sleep 3
winedesktop
