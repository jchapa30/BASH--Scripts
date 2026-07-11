#!/bin/bash

# Author: Joey Chapa
# Date: 6/9/26
# Date Modified: 6/9/26

# Check server connectivity

IP_LIST='IP_Hosts.sh'

if [ ! -f "$IP_LIST" ]
then
    echo "Host list not found: $IP_LIST" >&2
    exit 1
fi

while IFS= read -r host || [ -n "$host" ]
do
    if [ -z "$host" ] || [[ "$host" == \#* ]]
    then
        continue
    fi

    if [[ ! "$host" =~ ^[A-Za-z0-9][A-Za-z0-9._:-]{0,252}$ ]]
    then
        echo "Skipping invalid host: $host" >&2
        continue
    fi

    if ping -c1 "$host" >/dev/null 2>&1
    then
        echo "$host OK"
    else
        echo "$host NOT OK"
    fi
done < "$IP_LIST"
