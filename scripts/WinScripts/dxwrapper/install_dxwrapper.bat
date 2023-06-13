reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v ddraw /t REG_SZ /d native,builtin /f
start /unix /usr/bin/install_dxwrapper 1 -partial
