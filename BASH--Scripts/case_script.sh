#!/bin/bash

set -uo pipefail

echo
echo Please choose an option below
echo
echo 'a = Display Date and time'
echo 'b = List files and directories'
echo 'c = List users logged in'
echo 'd = Check system uptime'
echo

read -r choices

case $choices in
    a) date ;;
    b) ls ;;
    c) who ;;
    d) uptime ;;
    *) echo "Invalid choice - bye." >&2 ; exit 1 ;;
esac
