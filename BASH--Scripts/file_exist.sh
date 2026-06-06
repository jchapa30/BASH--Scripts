#!/bin/bash

file="test.txt"

if [ -f "$file" ]
then
    echo "$file exists."
else
    touch "$file"
    echo "$file did not exist, so it was created."
fi
