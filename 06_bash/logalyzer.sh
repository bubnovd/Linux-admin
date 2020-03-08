#!/bin/bash
#
#который раз в час присылает на заданную почту
#- X IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего #запуска скрипта
#- Y запрашиваемых адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента #последнего запуска скрипта
#- все ошибки c момента последнего запуска
#- список всех кодов возврата с указанием их кол-ва с момента последнего запуска
#в письме должно быть прописан обрабатываемый временной диапазон
#должна быть реализована защита от мультизапуска
 set -x #debug
FILE="/home/devi1/Documents/OTUS/Linux-admin_OTUS/06_bash/access-4560-644067.log"
PROG="logalyzer"
requests_count=10
url_count=10

requests(){
    cat $FILE | grep -B 9999 ${totime#[} | grep -A 9999 ${fromtime#[} | cut -d " " -f 1 | sort | uniq -c | sort -k1 -nr | head -n $requests_count
}

urls(){
    cat $FILE | grep -B 9999 ${totime#[} | grep -A 9999 ${fromtime#[} | cut -d " " -f 7 | sort | uniq -c | sort -nr -k1 | head -n $url_count
}

errors(){
    cat $FILE | cut -d \" -f 3 | cut -d " " -f 2 | egrep -v 200\|301
}

codes(){
    cat $FILE | cut -d \" -f 3 | cut -d " " -f 2 | sort | uniq -c
}

lockfile=/tmp/$PROG
tmpfile=/tmp/logalyzer_out
fromtime=$(cat /tmp/fromtime)

[ -e $FILE ] || exit 5
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null;
then
    trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT

    echo -n $"Starting $PROG: "
    totime=$( cat access-4560-644067.log  | cut -d " " -f 4 | tail -n 1 )
    echo "$totime" > /tmp/formtime
    echo "Top $requests_count IPs: " > $tmpfile
    requests >> $tmpfile
    echo "" >> $tmpfile
    echo "Top $url_count URLs: " >> $tmpfile
    urls >> $tmpfile
    echo "" >> $tmpfile
    echo "Errors: " >> $tmpfile
    errors >> $tmpfile
    echo "" >> $tmpfile
    echo "Codes: " >> $tmpfile
    codes >> $tmpfile
   rm -f "$lockfile"
   trap - INT TERM EXIT
else
   echo "Failed to acquire lockfile: $lockfile."
   echo "Held by $(cat $lockfile)"
fi


