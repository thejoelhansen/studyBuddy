#!/bin/bash

# Import config
. conf 

# Get number of questions in a supplied chapter, allow specify # of loops and specific chapter - default all chapters? 

ch1='/home/joel/projects/studyBuddy/chapters/ex200_ch1'
rngStart=$(head $ch1 -c 1)
rngStop=$(tail $ch1 -n 1)

echo $rngStart
echo $rngStop

exit 0 
# Randomly select a number

# Print Question to STDOUT

# On button press print A and E
