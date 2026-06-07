#!/bin/bash

echo
echo Please choose an option below
echo
echo 'a = Display Date and time'
echo 'b = List files and directories'
echo 'c = List users logged in'
echo 'd = Check system uptime'
echo

read choices

case $choices in
    a) date ;;
    b) ls ;;
    c) who ;;
    d) uptime ;;
    *) echo "Invalid choice - bye." ;;
esac
