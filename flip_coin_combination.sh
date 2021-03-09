#!/bin/bash

declare -a singlet_array
declare -A singlet_dictionary=( [1]="Heads" [2]="Tails" )
for (( i=0 ;i<20 ;i++ ))
do
        singlet_substitute=$(( RANDOM % 2 + 1 ))
        singlet_array[$singlet_substitute]=$(( singlet_array[$singlet_substitute] + 1 ))
done

for single in ${!singlet_array[@]}
do
        echo "${singlet_dictionary[$single]} -- ${singlet_array[$single]} times"
done

#head_count=${singlet_array[1]}
#tail_count=${singlet_array[2]}
if [ ${singlet_array[1]} -gt ${singlet_array[2]} ]
then
	echo "HEADS WON BY $(( ( ${singlet_array[1]} * 100 ) / ( ${singlet_array[2]} + ${singlet_array[1]} ) )) %"
else
	echo "TAILS WON BY $(( ( ${singlet_array[2]} * 100 ) / ( ${singlet_array[1]} + ${singlet_array[1]} ) )) %"
fi
