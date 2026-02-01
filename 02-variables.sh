#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]; then
    echo "Given number is greater than 20"
elif [ $NUMBER -equal 20 ]; then
    echo "Given number is equal to 20"
else
    echo "Given number is less than 20"
fi