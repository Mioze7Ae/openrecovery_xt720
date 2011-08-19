#!/sbin/bash

RES=`imenu "What do you like?" "Dog" "Cat" "Cheetah" "Milestone"`
OK=$?
	
echo "Answer is $RES"
