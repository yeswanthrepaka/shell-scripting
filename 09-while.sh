#!/bin/bash

count=1

while [ $count -lt 5 ];
do
    echo "Number $count"
    sleep 1
    ((count++))
done
