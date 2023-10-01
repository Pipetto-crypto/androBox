#!/bin/bash

[[ ! -f ~/.local/cache/PhysX_9.10.0513_SystemSoftware.exe ]] && wget https://us.download.nvidia.com/Windows/9.10.0513/PhysX_9.10.0513_SystemSoftware.exe -P ~/.local/cache
wine ~/.local/cache/PhysX_9.10.0513_SystemSoftware.exe
