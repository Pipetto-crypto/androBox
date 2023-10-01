#!/bin/bash

wine -k
sleep 4
kill -9 $(pidof proot);exit
