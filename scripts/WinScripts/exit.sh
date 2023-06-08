#!/bin/bash

wine64 -k
sleep 4
kill -9 $(pidof proot);exit
