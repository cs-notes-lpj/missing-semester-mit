#! /usr/bin/env bash

echo "Starting program at $(date)"

echo "Runing program $0 with $# arguments with pid $$"

for file in "$@"; do
    grep foo "$file" > /dev/null 2> /dev/null
    # since we do not care about the STDOUT and STDERR, but we just care about the exit status code of grep

    if [[ "$?" -ne 0 ]]; then
        echo "File $file does not have any foo"
    fi

done

