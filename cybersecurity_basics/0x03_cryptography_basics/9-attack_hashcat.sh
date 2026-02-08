#!/bin/bash
hashcat -a 1 -m 0 "$1" wordlist1.txt wordlist2.txt && echo "<hashed_password>" > 9-password.txt
