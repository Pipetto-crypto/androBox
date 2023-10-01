@echo off

reg add HKEY_CURRENT_USER\Software\Wine\DirectInput /v MouseWarpOverride /t REG_SZ /d enable /f
