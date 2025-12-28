#!/bin/bash
whois "$1" | awk -F: '/Registrant|Admin|Tech/ {gsub(/^ +| +$/,"",$2); space=($1~/Street/?" ":""); ext=($1~/Ext/ && $2=="")?":":""; print $1 ext "," $2 space}' 
