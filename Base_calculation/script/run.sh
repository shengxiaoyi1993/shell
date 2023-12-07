#!/bin/bash
temp1=400d7c
echo $((16#${temp1}+4))

temp2=$((16#${temp1}+4))
echo "obase=16;${temp2}"|bc

delay_frames=$1
echo "delay_frames:"${delay_frames}

num_init=0x0C001001

combine_num=$((${num_init}|10#${delay_frames}))

echo "combine_num:"${combine_num}

echo "obase=16;${combine_num}"|bc

combine_num_b16=`echo "obase=16;${combine_num}"|bc`

echo "combine_num_b16:"${combine_num_b16}

combine_num0=$((0x0C001000|10#${delay_frames}))
echo "combine_num0:"${combine_num0}


