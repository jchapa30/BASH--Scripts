#!/bin/bash

#this will pull error message from syslog data

#Author: Joey Chapa
#Date: 6/8/2026

set -uo pipefail

BASE_DIR="/home/jchapa30/Devops/BASH--Scripts/BASH--Scripts"
SYSLOG="$BASE_DIR/syslog"
OUTPUT="$BASE_DIR/output-error"

if [ ! -r "$SYSLOG" ]; then
    echo "Error: syslog file '$SYSLOG' not found or not readable." >&2
    exit 1
fi

grep -i fail "$SYSLOG" > "$OUTPUT"
status=$?

# grep exits 1 when there are simply no matches; treat only >1 as a real error.
if [ "$status" -gt 1 ]; then
    echo "Error: failed to write error report to '$OUTPUT'." >&2
    exit "$status"
fi
