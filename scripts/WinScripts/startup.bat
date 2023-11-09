@echo off

start /B F:\ProcessLasso\ProcessGovernor.exe
start /B F:\7zip\7zFM.exe E:
start /B Z:\usr\glibc\opt\WinScripts\ProcessLasso.bat
start /unix /data/data/com.termux/files/usr/glibc/opt/WinScripts/startup.sh
start /B F:\IB\ib.exe
