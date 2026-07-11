#!/usr/bin/env bats
# Tests for scripts that read from stdin.

load test_helper

setup() { common_setup; }
teardown() { common_teardown; }

@test "case_script.sh runs 'date' for choice a" {
    stub date 0 "FAKE-DATE-OUTPUT"
    run bash -c "echo a | bash '$SCRIPT_DIR/case_script.sh'"
    [ "$status" -eq 0 ]
    [[ "$output" == *"FAKE-DATE-OUTPUT"* ]]
}

@test "case_script.sh runs 'uptime' for choice d" {
    stub uptime 0 "FAKE-UPTIME"
    run bash -c "echo d | bash '$SCRIPT_DIR/case_script.sh'"
    [ "$status" -eq 0 ]
    [[ "$output" == *"FAKE-UPTIME"* ]]
}

@test "case_script.sh reports an invalid choice" {
    run bash -c "echo z | bash '$SCRIPT_DIR/case_script.sh'"
    [ "$status" -eq 0 ]
    [[ "$output" == *"Invalid choice - bye."* ]]
}

@test "input-script.sh greets the user with the entered name" {
    run bash -c "echo Alice | bash '$SCRIPT_DIR/input-script.sh'"
    [ "$status" -eq 0 ]
    [[ "$output" == *"Hello Alice"* ]]
    [[ "$output" == *"your hostname is"* ]]
}

@test "verify_user.sh reports an existing user as found" {
    local existing="$USER"
    run bash -c "echo '$existing' | bash '$SCRIPT_DIR/verify_user.sh'"
    [ "$status" -eq 0 ]
    [[ "$output" == *"$existing username was found"* ]]
}

@test "verify_user.sh attempts to create a missing user (sudo/adduser stubbed)" {
    stub sudo 0
    stub adduser 0
    local missing="nouser_$$_test"
    run bash -c "echo '$missing' | bash '$SCRIPT_DIR/verify_user.sh'"
    [ "$status" -eq 0 ]
    [[ "$output" == *"User does not exist, so it was created."* ]]
    [ "$(stub_call_count sudo)" -ge 1 ]
}
