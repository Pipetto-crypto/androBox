@echo off

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v ddraw /f
start /unix /usr/bin/remove_dxwrapper
