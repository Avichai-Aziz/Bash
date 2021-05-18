#!/bin/bash
#Avichai Aziz
if [[ $# -ne 2 ]] 
	then echo -e "Usage: $0 <matches-file> <team-name>\n"
	exit
fi

matches_file="$1"
team_name="$2"
total_num_goals=0

while read line ; do
	if [[ `echo $line | grep $team_name | wc -l` -eq 0 ]]
		then continue
	fi
	echo $line
	if [[ `echo $line | cut -f1 -d" "` == $team_name ]] ; then
		ngoals=`echo $line | cut -f3 -d" "`

	else
		ngoals=`echo $line | cut -f4 -d" "`

	fi
	total_num_goals=$((total_num_goals+ngoals))
done < "$matches_file" 
echo "$team_name scored $total_num_goals goals"
