@echo off

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v ddraw /f
start /unix /data/data/com.termux/files/usr/bin/remove_dxwrapper
