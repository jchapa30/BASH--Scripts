# Tests

Unit tests for the scripts in this directory, written with
[bats-core](https://github.com/bats-core/bats-core) (Bash Automated Testing
System).

## Running

Install bats (once):

```bash
sudo apt-get install -y bats        # Debian/Ubuntu
# or: brew install bats-core         # macOS
```

Run the whole suite from the repo's script directory:

```bash
bats tests/
```

Run a single file:

```bash
bats tests/pure_scripts.bats
```

## How it works

- `test_helper.bash` provides shared setup: a per-test temp dir and a `stub`
  helper that puts fake executables on `PATH`. This lets the tests replace
  external commands (`ping`, `sudo`, `apt`, `adduser`, `htop`, `java`, ...) so
  running the suite has **no real side effects** — nothing is installed,
  pinged, or created outside the temp dir.
- Scripts that used hard-coded absolute paths or IPs now read them from
  environment variables (`TARGET_DIR`, `SYSLOG`, `OUTPUT`, `HOSTS`,
  `IP_LISTS`) that default to the original values, which is what makes them
  testable.

## Coverage

| Script | Test file |
| --- | --- |
| `if-then.sh`, `variables.sh`, `for-loops.py`, `file_exist.sh` | `pure_scripts.bats` |
| `case_script.sh`, `input-script.sh`, `verify_user.sh` | `interactive_scripts.bats` |
| `htop.sh`, `install_java.sh` | `command_check_scripts.bats` |
| `server_status.sh`, `multiple_servers_ping.sh` | `network_scripts.bats` |
| `pull-fail.sh`, `pull-warnings.sh`, `pull-errors.sh` | `syslog_scripts.bats` |
| `delete_old_files.sh` | `delete_old_files.bats` |
