#!/bin/bash

command="/usr/bin/htop"

if [ -f "$command" ]
then
   echo "$command is available, running it"
else
   echo "$command is not available, installing it"
   sudo apt update && sudo apt install -y htop
fi

"$command"
