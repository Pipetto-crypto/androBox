#!/bin/bash

unset WINEPREFIX
winege -k
sleep 3
sed -i "8s/=.*/=/g" /sdcard/3in1ProotX86Emus/proot.conf
winedesktop
