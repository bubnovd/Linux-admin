#!/usr/bin/env bash
# Script for demonstrating arrays

array=('first' 'second' 'third')

echo $array

echo ""
echo "Print all array element in one line: "
echo "${array[*]}"


echo""
echo "Print all array element in multi line: "
IFS=$'\n'
echo "${array[*]}"