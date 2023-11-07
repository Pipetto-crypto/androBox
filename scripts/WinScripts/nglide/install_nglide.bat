@echo off


reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide2x /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide3x /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl2 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl3 /t REG_SZ /d native,builtin /f
start /unix /data/data/com.termux/files/usr/glibc/opt/WinScripts/nglide/install_nglide.sh
