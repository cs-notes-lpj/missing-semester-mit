#! /usr/bin/env bash

mcd () {
    mkdir -p "$1"
    cd "$1" || echo "Oops, cd failed..."
}

