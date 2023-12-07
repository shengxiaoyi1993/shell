#!/bin/bash
echo $#
echo "\$1:$1"

date_str=`date +%Y%m%d`
echo "date_str:${date_str}"

if [[ $# = 1 ]] 
then
    echo "\$# = 1 "
fi

if [[ ! $# = 0 ]] 
then
    echo "! \$# = 0 "
fi