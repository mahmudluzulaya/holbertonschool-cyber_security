#!/bin/bash
john "$1" && echo "<hashed_passwords>" > 6-password.txt
