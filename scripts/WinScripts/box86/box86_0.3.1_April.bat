@echo off

start /unix /usr/bin/box86switch 0.3.1 April
ping 192.0.2.1 -n 1 -w 4000 >nul
start /unix /opt/WinScripts/restart.sh
