#!/bin/bash

# Import config
. conf 

# !Get number of questions in a supplied chapter, allow specify # of loops and specific chapter - default all chapters? 

# ch="/home/joel/projects/studyBuddy/chapters/ex200_ch3"
ch=$installPath"chapters/"$testPath"_ch"$1

# test install path - main if wrap of script

if [ -e $ch ]; then

# !improve currently limited to 2 characters - make so that numbers are up until first letter (EG 121q -> 121)

	lastQ=$(tail $ch -n 1)

	rngStop=${lastQ:0:2}

	# Get # of questions
	echo "How many?"
	read numberQuestions

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

# Randomly select a number

# Print Question to STDOUT

# On button press print A and E
