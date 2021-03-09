#!/bin/bash 
declare -a doublet_array
declare -a singlet_array
declare -A singlet_dictionary=( [1]="Heads" [2]="Tails" )
declare -A doublet_dictionary=( [1]="H H" [2]="H T" [3]="T T" [4]="T H" )
for (( i=0 ;i<20 ;i++ ))
do
        singlet_substitute=$(( RANDOM % 2 + 1 ))
        singlet_array[$singlet_substitute]=$(( singlet_array[$singlet_substitute] + 1 ))
done

for (( i=0 ;i<20 ;i++ ))
do
        doublet_substitute=$(( RANDOM % 4 + 1 ))
        doublet_array[$doublet_substitute]=$(( doublet_array[$doublet_substitute] + 1 ))
done
for single in ${!singlet_array[@]}
do
        echo "${singlet_dictionary[$single]} -- ${singlet_array[$single]} times"
done

if [ ${singlet_array[1]} -gt ${singlet_array[2]} ]
then
	echo "HEADS WON BY $(( ( ${singlet_array[1]} * 100 ) / ( ${singlet_array[2]} + ${singlet_array[1]} ) )) %"
else
	echo "TAILS WON BY $(( ( ${singlet_array[2]} * 100 ) / ( ${singlet_array[1]} + ${singlet_array[1]} ) )) %"
fi
double_greatest=0
sum_double=0
test_retuner=0
for test in ${!doublet_array[@]}
do
	sum_double=$(( sum_double + ${doublet_array[$test]} ))
        if [ ${doublet_array[$test]} -ge $double_greatest ]
        then
                double_greatest=${doublet_array[$test]}
		test_returner=$test
        fi
done
for double in ${!doublet_array[@]}
do
        echo "${doublet_dictionary[$double]} -- ${doublet_array[$double]} times"
done

echo -e "\n${doublet_dictionary[$test_returner]} won by $(( ( double_greatest * 100 ) / sum_double )) %"
