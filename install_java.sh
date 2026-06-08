#!/bin/bash

command="java"

if command -v "$command" >/dev/null 2>&1
then
    echo "$command is available"
    "$command" -version
else
    echo "$command is not available, installing it..."
    sudo apt update
    sudo apt install -y default-jdk
fi
