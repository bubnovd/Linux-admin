#!/usr/bin/env bash
arr=(a b c d e f)
echo "array = ${arr[*]}"
echo "elements count = " ${#arr[@]}
for ((i=0;i<${#arr[@]};i++))
do
  echo "element $i = ${arr[$i]}"
done