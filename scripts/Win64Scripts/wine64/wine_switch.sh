#!/bin/bash

unset WINEPREFIX
wine64 -k
wineswitch $1 $2 
sleep 5
winedesktop64
