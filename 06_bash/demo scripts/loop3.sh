#!/usr/bin/env bash

i=0
arr=(a b c d e f)

while (( $i < ${#arr[*]} ))
do
  echo "${arr[$i]}"
  (( i++ ))
done