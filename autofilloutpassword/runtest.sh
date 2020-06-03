#!/usr/bin/expect
spawn ./test.sh
expect "*password for*:"
send "sxy\r"
interact
