#!/bin/bash

count=1

while [ $count -lt 5 ];
do
    echo "Number $count" 
    # Print number less than 5
    sleep 1
    # Sleep for 1 second
    ((count++))
    # Increase the count by one number
done
