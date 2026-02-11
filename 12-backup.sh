#!/bin/bash

LOGS_FOLDER="/var/log/shell-scrips"
LOGS_FILE="/var/log/shell-scrips/backup.log"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #Default 14 days if not given
USERID=$(id -u)

usage(){
    echo "Minimum two args <source> <dest> <days- if not given it will take default 14>"
}

if [ $# -lt 2 ]; then
    usage
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "$SOURCE_DIR not available"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo "$DEST_DIR not available"
    exit 1
fi

FILE_FIND=$(find $SOURCE_DIR -type f -mtime +$DAYS)
ZIP_FILE_NAME="backup.tar.gz"

if [ -z $FILE_FIND ]; then
    echo "$FILE_FIND is empty"
else
    tar -zcvf $ZIP_FILE_NAME $FILE_FIND
    echo "ZIP process comleted"
fi

