#!/bin/sh

string0="hardware_20220312_tmp_Application_20220620_r591"
string1="hardware_20220312_tmp_Application_20210620_r591"
string2="hardware_20220312_tmp_Application_20220620_r591"
string3="hardware_20220311_tmp_Application_20220620_r591"


a="The cat sat on the mat"
b=cat
strindex() { 
    x="${1%%$2*}"
    [[ $x = $1 ]] && echo -1 || echo ${#x}
}
strindex "$a" "$b"   # prints 4
strindex "$a" foo    # prints -1

f0=$(strindex "$string0" Application)
f1=$(strindex "$string1" Application)
f3=$(strindex "$string3" Application)

# echo ${string0:0:f0}
# echo ${string3:0:f3}

 if [ ${string0:0:f0} = ${string3:0:f3} ] 
 then
     echo "0 3 equal"
 fi

  if [ ! ${string0:0:f0} = ${string3:0:f3} ] 
 then
     echo "0 3 not equal"
 fi
 
 if [  ${string0:0:f0} = ${string1:0:f1} ] 
 then
     echo "0 1  equal"
 fi
if [ ! ${string0:0:f0} = ${string1:0:f1} ] 
 then
     echo "0 1 not equal"
 fi
 