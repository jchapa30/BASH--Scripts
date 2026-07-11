#!/bin/bash

#Author: Joey Chapa
#Date: 6/6/26
#Description:

set -uo pipefail

if ! a=$(hostname); then
    echo "Error: failed to determine hostname." >&2
    exit 1
fi

echo "Hello $USER, your hostname is $a."
echo
echo What is your name?
read -r b
echo
echo "Hello $b"
echo
