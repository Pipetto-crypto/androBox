@echo off

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /f
start /unix /data/data/com.termux/files/usr/bin/remove_d8vk
