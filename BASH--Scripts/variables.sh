#!/bin/bash

# Author: Joey Chapa
# Date: 6/6/26
# Description: Print first, last, and date

name="Joey"
last_name="Chapa"
working_directory=$(pwd)
d=$(date)

echo "Hi ${name} ${last_name}"
echo "Working in $working_directory"
echo "$d"
