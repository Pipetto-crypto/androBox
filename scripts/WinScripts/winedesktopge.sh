#!/bin/bash

unset WINEPREFIX
wine -k
sed -i "8s/=.*/=ge/g" /sdcard/3in1ProotX86Emus/proot.conf
sleep 3
winedesktopge
