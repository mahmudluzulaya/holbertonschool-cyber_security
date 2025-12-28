#!/bin/bash
whois "$1" | awk 'BEGIN{OFS=", "} /Registrant|Admin|Tech/ {gsub(/^ +| +$/,""); split($0,a,":"); value=substr($0,index($0,a[2])); if(value=="") value=" "; print a[1], value}' > "$1.csv"
