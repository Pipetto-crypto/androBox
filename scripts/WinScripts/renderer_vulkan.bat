@echo off

reg add HKEY_CURRENT_USER\Software\Wine\Direct3D /v renderer /t REG_SZ /d vulkan /f
