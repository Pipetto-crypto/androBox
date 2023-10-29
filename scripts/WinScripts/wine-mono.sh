#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

WINEDLLOVERRIDES="mshtml=" wine wineboot -u
