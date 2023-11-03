# androBox

androBox is a x86 emulator using Termux, Box86 and Box64. Unlikely similiar projects, this one runs completely natively on Android without chroot/proot resulting in greater speed, all thanks to Glibc-for-Termux project.

# Requirments

An Android phone preferably running Android 10 or newer, Termux from F-Droid  and Termux-X11 apk.

# Install

Paste this command in terminal:

>rm -rf ~/setup.sh && curl -L https://raw.githubusercontent.com/Pipetto-crypto/androBox/androBoxNew/setup.sh -O && source setup.sh

# Simple Usage

Run winedesktop to start it, it autolaunches Termux X11. If it does not, update from Start Menu (Update->Scripts). If for some reasons, the X11 server doesn't start, run winedesktop with the -ol option: winedesktop -ol

# Links and Credits

Termux: https://github.com/termux/termux-app

Termux-X11: https://github.com/termux/termux-x11

Box86: https://github.com/ptitSeb/box86

Box64: https://github.com/ptitSeb/box64

Mesa: https://gitlab.freedesktop.org/mesa/mesa

Glibc-for-termux: https://github.com/termux-pacman/glibc-packages.git

Wine: https://gitlab.winehq.org/wine/wine

Winetricks: https://github.com/Winetricks/winetricks

7z: https://github.com/mcmilk/7-Zip




