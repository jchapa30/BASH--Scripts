#!/bin/bash

ensure_apt_package() {
    local command_name="$1"
    local package_name="${2:-$command_name}"

    if command -v "$command_name" >/dev/null 2>&1
    then
        echo "$command_name is available"
        return
    fi

    echo "$command_name is not available, installing it..."
    sudo apt update
    sudo apt install -y "$package_name"
}

report_host_status() {
    local host="$1"

    if ping -c1 "$host" >/dev/null 2>&1
    then
        echo "$host OK"
        return 0
    fi

    echo "$host NOT OK"
    return 1
}

filter_log() {
    local pattern="$1"
    local input_file="$2"
    local output_file="${3:-}"

    if [ -n "$output_file" ]
    then
        grep -i -- "$pattern" "$input_file" > "$output_file"
    else
        grep -i -- "$pattern" "$input_file"
    fi
}
