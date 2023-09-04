#!/bin/bash

# Import config
. conf 

# !! state --help as $1=subject folder && $2=chapter file

# Get subject folder
if [ -z $1 ]; then
	echo "What subject? Must match quiz subject folder name"	
	read subject
else
	subject=$1
fi

# Test subject folder exists 
if [ -z $subject ]; then
	echo "Subject not supplied - exiting..."
	exit 1
elif [ ! -d $subject ]; then
	echo "Subject folder not found - exiting..."
	exit 1
fi

# Get for chapter based on file
if [ -z $2 ]; then
	echo "What chapter? Press Return to randomize from ch1-ch99"
	read chapter

	# If empty let chapter be random
	if [ -z $chapter ]; then
		chapter=$(ls $installPath/$subject | sort -R | head -n 1)
	fi		
fi

# Test chapter exists
if [ ! -f $installPath/$subject/$chapter ]; then
	echo "Chapter file not found - exiting..."
fi

# Full path to quiz & chapter
ch=$installPath/$subject/$chapter

# Test install path - main if wrap of script
if [ -e $ch ]; then

# !!improve currently limited to 2 char AKA 1q through 99q - make so that numbers are up until first letter (EG 121q -> 121)

	lastQ=$(tail $ch -n 1)

	rngStop=${lastQ:0:2}

	# Get # of questions
	echo "How many?"
	read numberQuestions
	# Test empty - make endless 
	if [ -z $numberQuestions ]; then
		numberQuestions=500
	fi
	
	# Loop through # of questions in given chapter
	for (( COUNT=$numberQuestions; COUNT>0; COUNT-- 
	)); do

		# Get random number
		rng=$[ $RANDOM % $rngStop + 1 ] 

		# Fetch equally random question
		q=$(grep -w $rng"q" $ch ) 
		a=$(grep -w $rng"a" $ch )
		e=$(grep -w $rng"e" $ch )
		
		echo $q
		read answer
		echo $a
		echo $e
		echo "Any key to continue..."
		read answer

	done

# closing fi from test path check
else
	echo "Can't find" $ch
	exit 1
fi

exit 0 
