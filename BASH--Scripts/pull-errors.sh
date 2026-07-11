#!/bin/bash

#this will pull error message from syslog data

#Author: Joey Chapa
#Date: 6/8/2026



SYSLOG="${SYSLOG:-/home/jchapa30/Devops/BASH--Scripts/BASH--Scripts/syslog}"
OUTPUT="${OUTPUT:-/home/jchapa30/Devops/BASH--Scripts/BASH--Scripts/output-error}"

grep -i fail "$SYSLOG" > "$OUTPUT"
