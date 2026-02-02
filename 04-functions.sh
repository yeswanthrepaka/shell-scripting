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

dnf install nginx -y
VALIDATE $? "Installing nginx"

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install nodejs -y
VALIDATE $? "Installing nodejs"