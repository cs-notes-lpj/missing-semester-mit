#! /usr/bin/env bash

TIME=0
FILE="$PWD/o.txt"

echo "----$(date)----" >> $FILE

while $1 >> $FILE 2>> $FILE; do
    # TIME=$(($TIME+1))
    ((TIME++))
done

echo "Successfully run $TIME times." | tee -a $FILE
