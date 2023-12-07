#!/bin/sh

#
# exec 2>/dev/null
# exec 1>/dev/null
# exec 3>/dev/null

exec 4<&1 
exec 5<&2 
exec 2>/dev/null
exec 1>/dev/null
# exec 1<&4 
# exec 2<&5

echo "interest"

exec 1<&4 
echo "SUCCEED"
# exit 0

# echo "FAIL"
# exit 1

# du /home/root/BOOT.BIN -s