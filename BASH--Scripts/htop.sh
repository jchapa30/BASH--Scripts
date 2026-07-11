#!/bin/bash

set -euo pipefail

command="htop"

if command -v "$command" >/dev/null 2>&1
then
   echo "$command is available"
else
   echo "$command is not available, installing it."
   if ! sudo apt update || ! sudo apt install -y "$command"; then
       echo "Error: failed to install '$command'." >&2
       exit 1
   fi
fi

"$command"
