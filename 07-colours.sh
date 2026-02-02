#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run the script with sudo user $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2... $R FAILURE $N"
    else
        echo -e "$2... $G SUCCESS $N"
    fi
}

for package in $@
    do
        dnf list installed $package
        if [ $? -ne 0 ]; then
            echo -e "$R $package not installed... Now installing $N"
            dnf install $package -y
            VALIDATE $? "Installing $package"
        else
            echo -e "$Y $package already installed... SKIPPING $N"
        fi
    done