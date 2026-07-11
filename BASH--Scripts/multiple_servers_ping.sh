#!/bin/bash

# Author: Joey Chapa
# Date: 6/9/26
# Date Modified: 6/9/26

# Check server connectivity

set -uo pipefail

IP_Lists='IP_Hosts.sh'

if [ ! -f "$IP_Lists" ]; then
    echo "Error: IP list file '$IP_Lists' not found." >&2
    exit 1
fi

exit_code=0

while read -r ip
do
    [ -z "$ip" ] && continue

    if ping -c1 "$ip" >/dev/null 2>&1
    then
        echo "$ip OK"
    else
        echo "$ip NOT OK"
        exit_code=1
    fi
done < "$IP_Lists"

exit "$exit_code"
