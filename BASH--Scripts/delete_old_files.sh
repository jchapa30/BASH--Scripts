#!/bin/bash

set -euo pipefail

TARGET_DIR="/home/jchapa30/Devops/BASH--Scripts/BASH--Scripts"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: target directory '$TARGET_DIR' does not exist." >&2
    exit 1
fi

if ! find "$TARGET_DIR" -type f -mtime +30 -delete; then
    echo "Error: failed to delete old files in '$TARGET_DIR'." >&2
    exit 1
fi
