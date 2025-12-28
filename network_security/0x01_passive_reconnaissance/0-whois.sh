#!/bin/bash
whois "$1" | awk '/Registrant|Admin|Tech/ {gsub(/^ +| +$/,""); gsub(/: +/,":"); print $1","substr($0,index($0,$2))}' > "$1.csv"
