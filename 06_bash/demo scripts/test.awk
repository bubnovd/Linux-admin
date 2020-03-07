BEGIN {print "start"} 
NR<10 { print FNR ") username: " $1 "\tuid:" $3 } 
END {print NR}