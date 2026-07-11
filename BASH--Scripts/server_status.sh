#!/bin/bash

#Author: Joey Chapa
#Date: 6/9/26
#Date Modified: 6/9/26

#Check server connectivity

set -uo pipefail

hosts="192.168.1.101"

if ping -c1 "$hosts" >/dev/null 2>&1
then
  echo "$hosts Ok"
else
  echo "$hosts Not Okay" >&2
  exit 1
fi
