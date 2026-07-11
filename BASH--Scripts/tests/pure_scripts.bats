#!/usr/bin/env bats
# Tests for the deterministic, side-effect-free scripts.

load test_helper

setup() { common_setup; }
teardown() { common_teardown; }

@test "if-then.sh reports count is 100" {
    run bash "$SCRIPT_DIR/if-then.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"Count is 100"* ]]
    [[ "$output" != *"Count is not 100"* ]]
}

@test "variables.sh prints name, working directory and date" {
    cd "$TEST_TEMP_DIR"
    run bash "$SCRIPT_DIR/variables.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"Hi Joey Chapa"* ]]
    [[ "$output" == *"Working in $TEST_TEMP_DIR"* ]]
    [[ "$output" == *"The system time and date is"* ]]
}

@test "for-loops.py prints a welcome message five times" {
    run bash "$SCRIPT_DIR/for-loops.py"
    [ "$status" -eq 0 ]
    [ "$(printf '%s\n' "$output" | grep -c 'Welcome')" -eq 5 ]
    [[ "$output" == *"Welcome 1 times"* ]]
    [[ "$output" == *"Welcome 5 times"* ]]
}

@test "file_exist.sh creates the file when it is missing" {
    cd "$TEST_TEMP_DIR"
    [ ! -f test.txt ]
    run bash "$SCRIPT_DIR/file_exist.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"did not exist, so it was created."* ]]
    [ -f test.txt ]
}

@test "file_exist.sh reports the file already exists" {
    cd "$TEST_TEMP_DIR"
    touch test.txt
    run bash "$SCRIPT_DIR/file_exist.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"test.txt exists."* ]]
}
