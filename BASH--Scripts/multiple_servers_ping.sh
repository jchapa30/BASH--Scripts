#!/bin/bash

# Author: Joey Chapa
# Date: 6/9/26
# Date Modified: 6/9/26

# Check server connectivity

IP_Lists='IP_Hosts.sh'

for ip in $(cat "$IP_Lists")
do
    ping -c1 "$ip" >/dev/null 2>&1

    if [ $? -eq 0 ]
    then
        echo "$ip OK"
    else
        echo "$ip NOT OK"
    fi
done
