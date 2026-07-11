#!/usr/bin/env bats
# Tests for the connectivity-checking scripts (ping is stubbed).

load test_helper

setup() { common_setup; }
teardown() { common_teardown; }

@test "server_status.sh reports OK when ping succeeds" {
    stub ping 0 "1 packets transmitted, 1 received"
    run env HOSTS="10.0.0.1" bash "$SCRIPT_DIR/server_status.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"10.0.0.1 Ok"* ]]
}

@test "server_status.sh reports Not Okay when ping fails" {
    stub ping 1
    run env HOSTS="10.0.0.2" bash "$SCRIPT_DIR/server_status.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"10.0.0.2 Not Okay"* ]]
}

@test "multiple_servers_ping.sh reports OK for every reachable host" {
    stub ping 0
    local list="$TEST_TEMP_DIR/hosts"
    printf '10.0.0.1\n10.0.0.2\n' > "$list"
    run env IP_LISTS="$list" bash "$SCRIPT_DIR/multiple_servers_ping.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"10.0.0.1 OK"* ]]
    [[ "$output" == *"10.0.0.2 OK"* ]]
    [ "$(stub_call_count ping)" -eq 2 ]
}

@test "multiple_servers_ping.sh reports NOT OK for an unreachable host" {
    stub ping 1
    local list="$TEST_TEMP_DIR/hosts"
    printf '10.0.0.9\n' > "$list"
    run env IP_LISTS="$list" bash "$SCRIPT_DIR/multiple_servers_ping.sh"
    [ "$status" -eq 0 ]
    [[ "$output" == *"10.0.0.9 NOT OK"* ]]
}
