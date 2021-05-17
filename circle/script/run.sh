#!/bin/bash

count=0
add=1

while [ 0 -eq 0 ]; do
  echo "incycle"
  sleep 1s
  declare -i count=${count}+${add}
  echo "count:"${count}
  filename="imagerecord_0_${count}.txt"
  echo "filename:"${filename}
  ./readmem 0x64000000 12288 4096 ${filename}
  tftp -pl ${filename} 192.168.1.126
done
