#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with sudo user"
    exit 1
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "Installing nginx... FAILURE"
    else
        echo "Installing nginx... SUCCESS"
}

dnf install nginx -y
VALIDATE