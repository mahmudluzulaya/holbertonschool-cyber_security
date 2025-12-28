#!/bin/bash
subfinder -silent -d "$1" | tee /tmp/subs.txt && while read s; do ip=$(dig +short "$s" | head -n1); [ -n "$ip" ] && echo "$s,$ip"; done < /tmp/subs.txt > "$1.txt"
