#!/usr/bin/env bats
# Tests for scripts that check whether a command is installed.

load test_helper

setup() { common_setup; }
teardown() { common_teardown; }

@test "htop.sh reports htop is available and runs it" {
    stub htop 0 "htop launched"
    run bash "$SCRIPT_DIR/htop.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"htop is avaliable"* ]]
    [[ "$output" == *"htop launched"* ]]
    [ "$(stub_call_count htop)" -ge 1 ]
}

@test "htop.sh tries to install htop when it is missing" {
    stub sudo 0
    stub apt 0
    # Restrict PATH so htop is not found; builtins still work without PATH.
    run env PATH="$STUB_BIN" "$BASH" "$SCRIPT_DIR/htop.sh"
    [[ "$output" == *"htop is not avaliable, installing it."* ]]
    [ "$(stub_call_count sudo)" -ge 1 ]
}

@test "install_java.sh reports java is available and prints its version" {
    stub java 0 "openjdk version fake"
    run bash "$SCRIPT_DIR/install_java.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"java is available"* ]]
    [[ "$output" == *"openjdk version fake"* ]]
    [ "$(stub_call_count java)" -ge 1 ]
}

@test "install_java.sh installs the jdk when java is missing" {
    stub sudo 0
    stub apt 0
    run env PATH="$STUB_BIN" "$BASH" "$SCRIPT_DIR/install_java.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"java is not available, installing it..."* ]]
    [ "$(stub_call_count sudo)" -ge 1 ]
}
