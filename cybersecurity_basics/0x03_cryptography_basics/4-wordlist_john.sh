#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" && echo "<hashed_passwords>" > 4-password.txt
