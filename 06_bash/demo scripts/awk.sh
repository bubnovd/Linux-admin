awk -F":" '{ print $1" : "$7}' /etc/passwd


logFile=/var/log/httpd/access_log
cat $logFile | awk '/GET \/ HTTP/{ ipcount[$1]++ } END { for (i in ipcount) { printf "IP:%13s - %d times\n", i, ipcount[i] } }' | sort -rn | head -20