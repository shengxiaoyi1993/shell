#!/bin/bash


# 判断某字符是否包含某个字符

reg='-'
if [[ "wsconnect.bsp.root.log.WARNING.20210410-023726.1187" =~ $reg ]];
then
  echo " matches "

else
  echo "not matches "
fi
