#!/bin/bash
# World-writable qovluqları tap, çap et və icazələrini 755-ə (drwxr-xr-x) dəyiş
find / -type d -perm -0002 -print -exec chmod 755 {} + 2>/dev/null
