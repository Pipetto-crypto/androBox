@echo off

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v ddraw /t REG_SZ /d native,builtin /f
start /unix /data/data/com.termux/files/usr/bin/install_dxwrapper -partial
