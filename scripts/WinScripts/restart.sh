#!/bin/bash

proton -k
sleep 2
wine -k
sleep 2
if [ "$(cat /tmp/isProton)" == "0" ] || [ "$(cat /tmp/isProton)" == "" ]
then
     winedesktop $@
else
     protondesktop $@
fi
