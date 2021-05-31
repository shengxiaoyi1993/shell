#!/bin/bash
arr=(
0
"1"
"2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "e" "e" "f")
# arr=$(ls *)

for value in ${arr[@]}
do
echo $value
done


echo "\$PATH"



arr[${#arr[@]}]="z"

for value in ${arr[@]}
do
echo $value
done

# 字符串排序

folders=(1 3 2 9 7 10 6)
len=${#folders[@]}

for((i=0; i<$len; i++)){
 for((j=i+1; j<$len; j++)){

   if [[ ${folders[i]} -gt ${folders[j]} ]]
   then
     temp=${folders[i]}
     folders[i]=${folders[j]}
     folders[j]=$temp
   fi

 }
}

echo ${folders[@]}
