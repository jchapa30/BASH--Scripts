#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=lib/system_utils.sh
source "$SCRIPT_DIR/lib/system_utils.sh"

#this will pull failure messages from syslog data

#Author: Joey Chapa
#Date: 6/8/2026

syslog_file="${1:-$SCRIPT_DIR/syslog}"

filter_log "fail" "$syslog_file"
