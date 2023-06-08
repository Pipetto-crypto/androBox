#!/bin/bash

unset WINEPREFIX
wine -k
wineswitch $1 $2 
sleep 5
winedesktop
