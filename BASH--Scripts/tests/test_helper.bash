# Shared helpers for the bats test suite.

# Absolute path to the directory containing the scripts under test.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Create a per-test working area and a directory for command stubs that is
# prepended to PATH. This lets tests replace external commands (ping, sudo,
# apt, adduser, htop, java, ...) with harmless fakes so no real side effects
# occur.
common_setup() {
    TEST_TEMP_DIR="$(mktemp -d)"
    STUB_BIN="$TEST_TEMP_DIR/bin"
    mkdir -p "$STUB_BIN"
    PATH="$STUB_BIN:$PATH"
}

common_teardown() {
    if [ -n "${TEST_TEMP_DIR:-}" ] && [ -d "$TEST_TEMP_DIR" ]; then
        rm -rf "$TEST_TEMP_DIR"
    fi
}

# stub <name> <exit_code> [output line...]
# Create an executable stub in STUB_BIN that prints the given lines and exits
# with the given code. Also records each invocation (with args) to
# "$STUB_BIN/<name>.calls" so tests can assert how it was called.
stub() {
    local name="$1"; shift
    local code="$1"; shift
    local file="$STUB_BIN/$name"
    {
        echo '#!/bin/bash'
        echo "echo \"\$0 \$*\" >> \"$STUB_BIN/$name.calls\""
        local line
        for line in "$@"; do
            printf 'echo %q\n' "$line"
        done
        echo "exit $code"
    } > "$file"
    chmod +x "$file"
}

# Number of times a stubbed command was invoked.
stub_call_count() {
    local name="$1"
    local f="$STUB_BIN/$name.calls"
    [ -f "$f" ] && wc -l < "$f" | tr -d ' ' || echo 0
}
