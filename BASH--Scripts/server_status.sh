#!/bin/bash

#Author: Joey Chapa
#Date: 6/9/26
#Date Modified: 6/9/26

#Check server connectivity

hosts="192.168.1.101"

ping -c1 $hosts

if [ $? -eq 0 ]
then
  echo $hosts Ok
else
  echo $hosts Not Okay
fi
