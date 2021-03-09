#!/bin/bash

if [ $(( RANDOM % 2 )) -eq 0 ]
then
	echo "HEADS"
else
	echo "TAILS"
fi
