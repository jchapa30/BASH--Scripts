#!/usr/bin/env bats
# Tests for delete_old_files.sh (TARGET_DIR is overridable).

load test_helper

setup() { common_setup; }
teardown() { common_teardown; }

@test "delete_old_files.sh removes files older than 30 days but keeps recent ones" {
    local target="$TEST_TEMP_DIR/target"
    mkdir -p "$target"

    touch "$target/recent.txt"
    touch "$target/old.txt"
    # Backdate one file to 40 days ago.
    touch -d "40 days ago" "$target/old.txt"

    run env TARGET_DIR="$target" bash "$SCRIPT_DIR/delete_old_files.sh"
    [ "$status" -eq 0 ]
    [ -f "$target/recent.txt" ]
    [ ! -f "$target/old.txt" ]
}

@test "delete_old_files.sh leaves a directory of only recent files untouched" {
    local target="$TEST_TEMP_DIR/target2"
    mkdir -p "$target"
    touch "$target/a.txt" "$target/b.txt"

    run env TARGET_DIR="$target" bash "$SCRIPT_DIR/delete_old_files.sh"
    [ "$status" -eq 0 ]
    [ -f "$target/a.txt" ]
    [ -f "$target/b.txt" ]
}
