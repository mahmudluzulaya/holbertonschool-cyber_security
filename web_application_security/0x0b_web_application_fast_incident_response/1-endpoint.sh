#!/bin/bash
# logs.txt faylından ən çox müraciət edilən URL-i tapır

# 1. awk ilə dırnaq içindəki sorğunun ikinci hissəsini ($7 - standart log formatında URL-dir) götürürük
# 2. sort və uniq ilə sayırıq
# 3. Ən çox təkrarlananı başa gətirib ilk sətri çap edirik

awk -F' ' '{print $7}' logs.txt | sort | uniq -c | sort -rn | head -1 | awk '{print $2}'
