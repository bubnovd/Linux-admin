#!/usr/bin/env bash
# Script for demostrating functions in bash

lines () {
    cat $1 | wc -l
}

num=$( lines $1 )

echo "File $1 has $num lines in it"