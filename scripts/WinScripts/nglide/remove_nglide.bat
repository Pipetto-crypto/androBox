@echo off

del C:\windows\syswow64\glide.dll
del C:\windows\syswow64\glide2x.dll
del C:\windows\syswow64\glide3x.dll
del C:\windows\system32\glide.dll
del C:\windows\system32\glide2x.dll
del C:\windows\system32\glide3x.dll
del C:\windows\syswow64\3dfxSpl.dll
del C:\windows\syswow64\3dfxSpl2.dll
del C:\windows\syswow64\3dfxSpl3.dll
del C:\windows\system32\3dfxSpl.dll
del C:\windows\system32\3dfxSpl2.dll
del C:\windows\system32\3dfxSpl3.dll
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide2x /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide3x /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl2 /f
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl3 /f
