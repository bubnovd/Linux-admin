#!/usr/bin/env bash
# Script that show how loop works
# We can loop throug files in dir
files=`ls /var/log/`
for FILE in $files
do
  echo $FILE
done

# You can loop through entire file. For example we have a file with servers FQDNs
for server in `cat $HOME/linux_list`
do
  ssh root@$server $1
done
