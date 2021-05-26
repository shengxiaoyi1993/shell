#!/bin/bash
# 用于将相对路径转换成绝对路径
#./run.sh
#./run.sh ~/Software/hhh


DIR=~/Software/self
wdir=$(cygpath.exe -p ${DIR} -w)
FLAG=--prefix-file="${wdir}"
echo "FLAG:" ${FLAG}
echo "wdir:" ${wdir}


echo $1
