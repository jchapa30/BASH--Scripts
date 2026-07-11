# 🐚 Bash Practice Projects

## 📌 Overview
This repository is a collection of small Bash scripting projects and practice exercises.  
The goal is to build confidence with:
- Writing and editing scripts using **Vim**
- Understanding core **Linux commands**
- Automating common tasks
- Practicing **file permissions**, process management, and scripting patterns

## Shared utilities

Reusable system helpers live in `lib/system_utils.sh`:

- `ensure_apt_package` checks for a command and installs its package when needed.
- `report_host_status` pings a host and prints a consistent status.
- `filter_log` searches a log and can write matches to an output file.

Scripts resolve the utility path relative to their own location, so they can be
run from any working directory.
