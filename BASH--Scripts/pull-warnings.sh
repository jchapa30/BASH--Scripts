#!/bin/bash

#this will pull warning messages from syslog data

#Author: Joey Chapa
#Date: 6/8/2026

set -uo pipefail

SYSLOG="/home/jchapa30/Devops/BASH--Scripts/BASH--Scripts/syslog"

if [ ! -r "$SYSLOG" ]; then
    echo "Error: syslog file '$SYSLOG' not found or not readable." >&2
    exit 1
fi

grep -i warn "$SYSLOG"
status=$?

# grep exits 1 when there are simply no matches; treat only >1 as a real error.
if [ "$status" -gt 1 ]; then
    echo "Error: grep failed while reading '$SYSLOG'." >&2
    exit "$status"
fi
