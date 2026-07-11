#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=lib/system_utils.sh
source "$SCRIPT_DIR/lib/system_utils.sh"

# Author: Joey Chapa
# Date: 6/9/26
# Date Modified: 6/9/26

# Check server connectivity

hosts_file="${1:-$SCRIPT_DIR/IP_Hosts.sh}"

while IFS= read -r ip || [ -n "$ip" ]
do
    [ -z "$ip" ] && continue
    report_host_status "$ip"
done < "$hosts_file"
