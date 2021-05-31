#!/bin/bash

# 轮询时间
TIME_INTERVAL=1
MEM_LIMIT=10000000
# MEM_LIMIT=36000


PATH_LOGDIR=/home/root/log
# PATH_LOGDIR=/home/sxy/Github/shell/checkFile/resources/log



# main_loop
# 检查文件夹容量
# 若容量大于规定值
# 若容量小于规定值
#  等待一定时间，跳回main_loop起始
# 获取文件夹下的文夹列表
# 获取最新的文件名列表（即文件列表中符号链接的对象）
# 获取最普通log文件数组
# 符对普通log文件数组进行排序
# 取普通log文件数组中最近修改时间最早的文件，若该文件不是最新的文件数组中的元素，则删除该文件，跳回main_loop起始


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


while [ 0 -eq 0 ]; do
  array_mem=(`du ${PATH_LOGDIR} -sb`)

  # echo "array_mem:" ${array_mem}

  mem=${array_mem[0]}
  # echo "mem:" ${mem}
  mem_val=$((10#${mem}))
  # echo "mem_val:" ${mem_val}
  # echo "MEM_LIMIT:" ${MEM_LIMIT}

  if [[ ! ${mem_val} -gt ${MEM_LIMIT} ]]; then
    # echo "below"
    sleep ${TIME_INTERVAL}
    continue
  fi

  getdir ${PATH_LOGDIR}

# 所有文件的绝对路径保存在列表中arr
for value in ${arr[@]}
do
  if [[ -L ${value} ]]; then
    # echo ${value}
    array_new[${#array_new[@]}]=`ls -l ${value} | awk '{print $11}'`

  fi
done

#此时array_new保存了最新的文件的文件名


#获取不同，非符号连接的文件
for value in ${arr[@]}
do
  if [[ ${value##*/} =~ '-' ]];
  then
    array_file[${#array_file[@]}]=${value}
  fi
done
# 此时array_file数组中保存着普通文件

#对数组进行排序
# folders=(1 3 2 9 7 10 6)
len=${#array_file[@]}

for((i=0; i<$len; i++)){
 for((j=i+1; j<$len; j++)){
   last_time_i=$(stat -c %Y ${array_file[i]})
   last_time_j=$(stat -c %Y ${array_file[j]})


   if [[ ${last_time_i} -gt ${last_time_j} ]]
   then
     temp=${array_file[i]}
     array_file[i]=${array_file[j]}
     array_file[j]=$temp
   fi

 }
}
# 此时array_file中的普通文件按照最近修改时间的顺序进行排列，最久没有修改的放在前面


#依次判断文件是否是最新的数据，删除非最新的最早的一个文件
for value in ${array_file[@]}
do
  if [[ "! ${array_new[@]}"  =~ "${value##*/}" ]]; then
    rm ${value}
    # echo "rm ${value}"
    break
  fi

done


done



done
