#!/usr/bin/env bash

for (( var=1; var < 15; var++))
do
  if [[ var -gt 5 ]] && [[ var -lt 10 ]]
  then
    continue
  fi

  echo "Iteration number: $var"
done