@echo off

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10 /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10_1 /f
start /unix /data/data/com.termux/files/usr/bin/remove_dxvk
