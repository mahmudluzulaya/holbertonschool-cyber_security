#!/bin/bash
john --format=nt "$1" && echo "<hashed_passwords>" > 5-password.txt
