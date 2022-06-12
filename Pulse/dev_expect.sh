#!/usr/bin/expect -f
set timeout 130
spawn ssh "syssitdmmmmuuu@server000002188.intranet.company.com"
expect "password: "
send "Omega@123\r"
expect "$ "
send "sh /home/syssitdmmmmuuu/HTML/run.sh\r"
expect "$ "
send "exit\r"