#!/usr/bin/expect -f
spawn scp "syssitdmmmmuuu@server000002189:/home/syssitdmmmmuuu/HTML/SIT_stat.txt" /home/Informaticauser/HADOOPSERVERSTATUS
expect "password"
send "Omega@123\r"
send "\r"
expect eof