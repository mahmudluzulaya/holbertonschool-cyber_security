#!/bin/bash
LOG_FILE="logs.txt"
if [ ! -f "$LOG_FILE" ]; then
    echo "Xəta: $LOG_FILE tapılmadı!"
    exit 1
fi
