#!/usr/bin/env bash
# Script that demonstrates IF and CASE statements

# CASE
case $1 in
--help)
  echo "Print help messege for this script"
  ;;
-p)
  echo "Your parameter is $1"
  ;&
else)
  echo "Prints only if $1 transmitted "
  ;;
esac


# IF
echo ""
dir=/var/log/nginx

if [[ -d $dir ]]
then
  echo "There is $dir dir on your system!!!"
else
  echo "$dir dir is epsend!"
fi