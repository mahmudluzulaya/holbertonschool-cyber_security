#!/bin/bash
# This script extracts the OS/Kernel version from the dmesg log file

LOG_FILE="dmseg"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE not found."
    exit 1
fi

# Search for the string "Linux version" within the file
grep "Linux version" "$LOG_FILE"
