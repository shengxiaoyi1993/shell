#!/bin/bash
arr=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "e" "e" "f")

for value in ${arr[@]}
do
sleep 1
echo $value
done
