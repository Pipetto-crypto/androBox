@echo off

del /Q /F C:\windows\syswow64\glide.dll C:\windows\syswow64\glide2x.dll C:\windows\syswow64\glide3x.dll C:\windows\system32\glide.dll C:\windows\system32\glide2x.dll C:\windows\system32\glide3x.dll C:\windows\syswow64\3dfxSpl.dll C:\windows\syswow64\3dfxSpl2.dll C:\windows\syswow64\3dfxSpl3.dll C:\windows\system32\3dfxSpl.dll C:\windows\system32\3dfxSpl2.dll C:\windows\system32\3dfxSpl3.dll
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide2x /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide3x /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl2 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl3 /f >NUL 2>&1
