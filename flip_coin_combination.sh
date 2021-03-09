#!/bin/bash
declare -a triplet_array
declare -a sorted_triplet
declare -a doublet_array
declare -a sorted_doublet
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
	echo -e "\nHEADS WON BY $(( ( ${singlet_array[1]} * 100 ) / ( ${singlet_array[2]} + ${singlet_array[1]} ) )) %\n"
else
	temporary_transfer=${singlet_array[1]}
	singlet_array[1]=${singlet_array[2]}
	singlet_array[2]=$temporary_transfer
	echo -e "\nTAILS WON BY $(( ( ${singlet_array[1]} * 100 ) / ( ${singlet_array[1]} + ${singlet_array[1]} ) )) %\n"
fi
sum_double=0
for assigner in ${!doublet_array[@]}
do
	sorted_doublet[$assigner]=${doublet_array[$assigner]}
	sum_double=$(( sum_double + ${doublet_array[$assigner]} ))
done
for((first_counter=${#sorted_doublet[@]};first_counter>=0; first_counter--));
        do

                for((second_counter=1;second_counter<=$first_counter; second_counter++));
                do
                        if [[ ${sorted_doublet[second_counter-1]} -lt ${sorted_doublet[second_counter]} ]];
                        then
                                temporary_storage=${sorted_doublet[second_counter-1]}
                                sorted_doublet[second_counter - 1]=${sorted_doublet[second_counter]}
                                sorted_doublet[second_counter]=$temporary_storage
                        fi
                done
        done
for print in ${!doublet_array[@]}
do
	echo -e "${doublet_dictionary[$print]} -- ${doublet_array[$print]} times"
done
echo -e "\nTHE COMBINATION WON BY $(( ( ${sorted_doublet[1]} * 100 ) / $sum_double )) %\n"


sum_triple=0
for assigner in ${!triplet_array[@]}
do
        sorted_triplet[$assigner]=${triplet_array[$assigner]}
        sum_triple=$(( sum_triple + ${triplet_array[$assigner]} ))
done
for((first_counter=${#sorted_triplet[@]};first_counter>=0; first_counter--));
        do

                for((second_counter=1;second_counter<=$first_counter; second_counter++));
                do
                        if [[ ${sorted_triplet[second_counter-1]} -lt ${sorted_triplet[second_counter]} ]];
                        then
                                temporary_storage=${sorted_triplet[second_counter-1]}
                                sorted_triplet[second_counter - 1]=${sorted_triplet[second_counter]}
                                sorted_triplet[second_counter]=$temporary_storage
                        fi
                done
        done

for print in ${!triplet_array[@]}
do
        echo -e "${triplet_dictionary[$print]} -- ${triplet_array[$print]} times"
done
echo -e "\nTHE COMBINATION WON BY $(( ( sorted_triplet[1] * 100 ) / sum_triple )) %\n"
