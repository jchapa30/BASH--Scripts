#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=lib/system_utils.sh
source "$SCRIPT_DIR/lib/system_utils.sh"

ensure_apt_package "java" "default-jdk"

java -version
