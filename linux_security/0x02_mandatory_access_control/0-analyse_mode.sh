#!/bin/bash

# Check the SELinux status using sestatus
# We use grep to find the status line and awk to clean up the output formatting
status=$(sestatus | grep "SELinux status:" | awk '{$1=$1; print $0}')

# If sestatus isn't installed or fails, we can check the config file as a fallback
if [ -z "$status" ]; then
    echo "SELinux status: Not found (Check if selinux-utils is installed)"
else
    echo "$status"
fi
