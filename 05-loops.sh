#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with sudo user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2... FAILURE"
    else
        echo "$2... SUCCESS"
    fi
}

for package in $@
    do
        dnf install $package -y
        VALIDATE $? "Installing $package"
    done