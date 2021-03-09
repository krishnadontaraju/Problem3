#!/bin/bash 
declare -a triplet_array
declare -a doublet_array
declare -a singlet_array
declare -A singlet_dictionary=( [1]="Heads" [2]="Tails" )
declare -A doublet_dictionary=( [1]="H H" [2]="H T" [3]="T T" [4]="T H" )
declare -A triplet_dictionary=( [1]="H H H" [2]="H H T" [3]="H T H" [5]="H T T" [4]="T H H" [6]="T H T" [7]="T T H" [8]="T T T" )
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

for (( i=0;i<50;i++ ))
do
        triplet_substitute=$(( RANDOM % 8 + 1 ))
        triplet_array[$triplet_substitute]=$(( triplet_array[$triplet_substitute] + 1 ))
done


if [ ${singlet_array[1]} -gt ${singlet_array[2]} ]
then
	echo -e "\nHEADS WON BY $(( ( ${singlet_array[1]} * 100 ) / ( ${singlet_array[2]} + ${singlet_array[1]} ) )) %"
else
	echo -e "\nTAILS WON BY $(( ( ${singlet_array[2]} * 100 ) / ( ${singlet_array[1]} + ${singlet_array[1]} ) )) %"
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
echo -e "\n"
for double in ${!doublet_array[@]}
do
        echo "${doublet_dictionary[$double]} -- ${doublet_array[$double]} times"
done

echo -e "\n${doublet_dictionary[$test_returner]} won by $(( ( double_greatest * 100 ) / sum_double )) %"

triple_greatest=0
sum_triple=0
test_retruner=0
for test in ${!triplet_array[@]}
do
        sum_triple=$(( sum_triple + ${triplet_array[$test]} ))
        if [ ${triplet_array[$test]} -ge $triple_greatest ]
        then
                triple_greatest=${triplet_array[$test]}
                test_returner=$test
        fi
done
echo -e "\n"
for triple in ${!triplet_array[@]}
do
        echo "${triplet_dictionary[$triple]} -- ${triplet_array[$triple]} times"
done

echo -e "\n${triplet_dictionary[$test_returner]} won by $(( ( triple_greatest * 100 ) / sum_triple )) %"
