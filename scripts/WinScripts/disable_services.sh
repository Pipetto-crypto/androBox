#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

kill -9 $(ps -aux | grep [s]ervices.exe | awk '{print $2}')
sed -i "4s/=.*/=disabled/g" $HOME/.androBox
