#!/bin/bash
#############################################################
#记录某个文件夹下的所有子文件夹和子文件，并保存到某个文件
#
#
#
#############################################################



function getdir(){
    # echo "in" $1
    for file in $1/*
    do
      # echo ${file}
    if test -f $file
    then
            echo $file
            arr=(${arr[*]} $file)
    elif  test -d $file
    then
      #statements
            getdir $file
    fi
    done
}
getdir /home/sxy/Github/shell/checkFile/resources/log



## 获取最早的数据

current=`date "+%Y-%m-%d %H:%M:%S"`
timeStamp=`date -d "$current" +%s`
#将current转换为时间戳，精确到毫秒
currentTimeStamp=$timeStamp
echo $currentTimeStamp

mintimestamp=$currentTimeStamp

for value in ${arr[@]}
do
  last_time=$(stat -c %Y $value)
  echo "${value}:${last_time}"
  # echo $last_time
  if [[ $mintimestamp -gt $last_time ]]; then
    mintimestamp=$last_time
    echo "mintimestamp:" ${mintimestamp}
    #statements
  fi

done

echo "mintimestamp:" ${mintimestamp}


echo "if L"

# array_new
# 判断是否是软链接
for value in ${arr[@]}
do
  if [[ -L ${value} ]]; then
    echo ${value}
    array_new[${#array_new[@]}]=`ls -l ${value} | awk '{print $11}'`

  fi
done

echo "array_new"

for value in ${array_new[@]}
do
echo $value
done
