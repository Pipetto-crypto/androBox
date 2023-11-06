@echo off

start /W F:\oalinst.exe
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v openal32 /t REG_SZ /d native,builtin /f
