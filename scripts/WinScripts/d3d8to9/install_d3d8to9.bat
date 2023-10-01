@echo off

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /t REG_SZ /d native,builtin /f
start /unix /usr/bin/install_d3d8to9 -partial
