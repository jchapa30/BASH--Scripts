#!/bin/bash

set -euo pipefail

command="java"

if command -v "$command" >/dev/null 2>&1
then
    echo "$command is available"
    "$command" -version
else
    echo "$command is not available, installing it..."
    if ! sudo apt update || ! sudo apt install -y default-jdk; then
        echo "Error: failed to install '$command'." >&2
        exit 1
    fi

    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Error: '$command' still not available after installation." >&2
        exit 1
    fi
    "$command" -version
fi
