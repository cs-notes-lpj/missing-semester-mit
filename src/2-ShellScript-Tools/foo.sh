#! /usr/bin/env bash

# n=$(RANDOM % 10)
# n=$((RANDOM % 10)) # 这个好使
n=$(( RANDOM % 10 ))
# echo $n

# if [n -eq 6]; then
# if [[n -eq 6]]; then # 这个不好使
if [[ n -eq 6 ]]; then
    echo "Something went wrong" >&2
    exit 1
fi

echo "Everything went according to plan"

