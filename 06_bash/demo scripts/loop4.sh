#!/usr/bin/env bash

i=5
until [[ i -eq 10 ]]
do
  echo "i=$i"
  i=$((i+1))
done