#!/bin/bash

set -euo pipefail

file="test.txt"

if [ -f "$file" ]
then
    echo "$file exists."
else
    if touch "$file"; then
        echo "$file did not exist, so it was created."
    else
        echo "Error: failed to create '$file'." >&2
        exit 1
    fi
fi
