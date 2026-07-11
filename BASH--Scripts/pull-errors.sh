#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=lib/system_utils.sh
source "$SCRIPT_DIR/lib/system_utils.sh"

#this will pull error message from syslog data

#Author: Joey Chapa
#Date: 6/8/2026

syslog_file="${1:-$SCRIPT_DIR/syslog}"
output_file="${2:-$SCRIPT_DIR/output-error}"

filter_log "error" "$syslog_file" "$output_file"
