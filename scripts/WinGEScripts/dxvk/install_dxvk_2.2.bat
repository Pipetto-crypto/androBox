reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /t REG_SZ /d native,builtin /f
start /unix /usr/bin/install_dxvk 2.2 4 -partial
