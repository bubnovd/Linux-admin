#!/usr/bin/env bash
# Script that demonstrates how variables works

var1=hello
declare var2=world!

echo "$var1 $var2"

echo ""
echo "Your home dir is $HOME"

echo ""
date=`date`
echo "Today is $date"

echo ""
var=$((1024*8))
echo $var

export var=myvar