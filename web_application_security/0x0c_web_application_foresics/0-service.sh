#!/bin/bash
# This script identifies the service under attack by parsing auth logs
# and counting the frequency of occurrences in the message field.

LOG_FILE="auth.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE not found."
    exit 1
fi

# 1. grep "sshd": Focus on SSH records
# 2. cut: Extract the part of the log after the hostname (column 5+)
# 3. awk: Print only the specific service/action strings
# 4. sort & uniq -c: Count the frequency of each unique line
# 5. sort -rn: Display the highest frequency first
grep "sshd" "$LOG_FILE" | cut -d ' ' -f 5- | awk '{print $1, $2}' | sort | uniq -c | sort -rn
