#!/bin/bash

string="4.0K	run.sh"

array=(${string})



for each in ${array[@]}
do
        echo $each
done

echo ${array[0]}
