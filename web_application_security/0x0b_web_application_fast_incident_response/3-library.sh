#!/bin/bash
ATTACKER_IP=$(awk '{print $1}' logs.txt | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')
grep "$ATTACKER_IP" logs.txt | awk -F'\"' '{print $6}' | sort | uniq -c | sort -rn | head -1 | awk '{print $1}'
