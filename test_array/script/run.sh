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
