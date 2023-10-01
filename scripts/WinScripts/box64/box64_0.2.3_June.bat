@echo off

start /unix /usr/bin/box64switch 0.2.3 June
ping 192.0.2.1 -n 1 -w 4000 >nul
start /unix /opt/WinScripts/restart.sh
