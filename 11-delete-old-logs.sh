#!/bin/bash

LOGS_FOLDER="/home/ec2-user/app-logs"
LOGS_FILE="$LOGS_FOLDER/$(basename "$0").log"

if [ ! -d $LOGS_FOLDER ]; then
    echo "$LOGS_FOLDER not exists"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_FOLDER -name *.logs -mtime +14)

if [ -z $FILES_TO_DELETE ]; then
    echo "Empty folder"
else
    while IFS= read -r filepath;
    do
        echo "Deleting files $filepath"
        rm -rf $filepath
        echo "Deleted files $filepath"
    done <<< $FILES_TO_DELETE
fi