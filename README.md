# 3in1ProotX86Emus
Exagear, box64 and box86 in the same proot rootfs. Already configured and ready to use

# Requirments

An Android phone, Termux from F-Droid and Termux:X11 app alongside its deb installed which you can download from Termux:X11 github action page.

# Installation

Download the rootfs from link sections and move it to the root of your Internal Storage. Copy paste this command in Termux:

curl -L https://raw.githubusercontent.com/Pipetto-crypto/3in1ProotX86Emus/master/setup.sh -o setup.sh && bash setup.sh

Once installation is completed, to access the proot you can type this command:

ubuntu or ubuntu -x in case you want to start Termux:X11 server alongside it

For non Adreno users that want to have GPU acceleration, they need to append the -va flag at the end of the second command.

To update the proot launcher script, it's possible to use the update argument:

ubuntu update


# Useful Proot commands

wineswitch - Allow to switch between different wine versions

update-bins - Update all the scripts inside the proot

install_dxvk - Install DXVK in all available wineprefixes, only for Turnip compatible Adreno GPUs and for box86/64

remove_dxvk - Remove DXVK from all available wineprefixes

exawine - Run a Windows program through exagear

exawineswitch - Switch wine version for exagear

gpuswitch - Switch gpu renderer, only for box86/64. Exagear only runs on turnip+zink or dxvk for now

install_winege - Install Proton for Lutris, not recommended as it is unstable on Android

winege - Run a Windows program through Proton for Lutris

wine64 - Run a Windows x86_64 program through box64

wine - Run a Windows x86 program through box86

More to come in the nearby future

# Links and Credits

Termux: https://github.com/termux/termux-app

Termux-X11: https://github.com/termux/termux-x11

Box86: https://github.com/ptitSeb/box86

Box64: https://github.com/ptitSeb/box64

Mesa: https://gitlab.freedesktop.org/mesa/mesa

Alexvorxx Turnip+Zink: https://github.com/alexvorxx/mesa-zink-11.06.22

Ubuntu ROOTFS: https://drive.google.com/file/d/168psM15CwXZY6Vp8TPBt3OijtrIE9Vg1/view?usp=drivesdk






