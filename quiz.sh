#!/bin/bash

# Import config
. conf 

# !Get number of questions in a supplied chapter, allow specify # of loops and specific chapter - default all chapters? 

ch="/home/joel/projects/studyBuddy/chapters/ex200_ch3"

# !improve currently limited to 2 characters - make so that numbers are up until first letter (EG 121q -> 121)

lastQ=$(tail $ch -n 1)

rngStop=${lastQ:0:2}

# Get random number
rng=$[ $RANDOM % $rngStop + 1 ] 

# Fetch equally random question
q=$(grep -w $rng"q" $ch ) 

echo $q

# prompt for return, then proceed

# show answer

# show extra if present

# loop finite amount? Like enter loop amount at beginning? 

exit 0 

# Randomly select a number

# Print Question to STDOUT

# On button press print A and E
