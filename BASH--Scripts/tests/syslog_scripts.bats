#!/usr/bin/env bats
# Tests for the log-scraping scripts (SYSLOG/OUTPUT paths are overridable).

load test_helper

setup() {
    common_setup
    SYSLOG_FILE="$TEST_TEMP_DIR/syslog"
    cat > "$SYSLOG_FILE" <<'EOF'
Jan 1 00:00:00 host service: started ok
Jan 1 00:00:01 host service: FAILed to connect
Jan 1 00:00:02 host service: warning disk space low
Jan 1 00:00:03 host service: another failure here
EOF
}
teardown() { common_teardown; }

@test "pull-fail.sh prints only the lines matching 'fail'" {
    run env SYSLOG="$SYSLOG_FILE" bash "$SCRIPT_DIR/pull-fail.sh"
    [ "$status" -eq 0 ]
    [ "$(printf '%s\n' "$output" | wc -l)" -eq 2 ]
    [[ "$output" == *"FAILed to connect"* ]]
    [[ "$output" == *"another failure here"* ]]
    [[ "$output" != *"started ok"* ]]
}

@test "pull-warnings.sh matches 'fail' lines" {
    run env SYSLOG="$SYSLOG_FILE" bash "$SCRIPT_DIR/pull-warnings.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"FAILed to connect"* ]]
}

@test "pull-errors.sh writes matching lines to the OUTPUT file" {
    local out="$TEST_TEMP_DIR/output-error"
    run env SYSLOG="$SYSLOG_FILE" OUTPUT="$out" bash "$SCRIPT_DIR/pull-errors.sh"
    [ "$status" -eq 0 ]
    [ -f "$out" ]
    [ "$(wc -l < "$out")" -eq 2 ]
    grep -q "FAILed to connect" "$out"
    grep -q "another failure here" "$out"
}
