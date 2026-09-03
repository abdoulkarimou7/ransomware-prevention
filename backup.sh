#! /bin/bash

set -euo pipefail

 if [ $# -eq 0 ]; then
    echo "You don't give any file path to backup. Using default path: ./sensitive-data"
    filePath="./sensitive-data"
    else
    filePath="$1"
fi

if [ ! -f "$filePath" ] && [ ! -d "$filePath" ]; then
    echo "Error: '$filePath' does not exist or is not a valid file/directory."
    exit 1
fi


if [ ! -d "./backups" ]; then
    mkdir "./backups"
fi

date=$(date +%Y-%m-%d_%Hh_%Mmin_%Ss)
if tar -czf "./backups/backup_zip_file_${date}_archive.tar.gz" "$filePath"; then
    echo "Backup successful."
else
    echo "Backup failed."
    exit 1
fi
