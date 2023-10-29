#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

kill -9 $(ps -aux | grep "[c]heckres" | awk '{print $2}')
kill -9 $(ps -aux | grep "[w]atch" | awk '{print $2}')
sed -i "3s/=.*/=disabled/g" $HOME/.androBox
