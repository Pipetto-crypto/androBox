@echo off
xcopy F:\vcrun2005\*.* C:\ /S /Y /Y /I
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v msvcm80 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v msvcp80 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v msvcr80 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v vcomp /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v atl80 /t REG_SZ /d native,builtin /f
