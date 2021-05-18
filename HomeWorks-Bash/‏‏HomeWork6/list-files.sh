#!/bin/bash
#Avichai Aziz
# Question 2 list-files.sh , looking for files by pattren inside a globe and returns the number of the matching pattern.

if [[ $# -ne 2 ]] ; then
	echo -e "Usage: $0 <root-directory> <pattern>"
	exit
fi
# assigning the root directory requested inside a variable.
root_directory="$1"
# assigning the pattern requested inside a variable.
pattern="$2"
for i in $(find $root_directory)
do
if [[ -d $i ]]; then
    echo -e "$i\t"$(find $i -name "$pattern" | wc -l)
fi
done