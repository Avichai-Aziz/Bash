#!/bin/bash

info_file=tmp/Abbey_Road.info.txt

#q1
if [[ $# -ne 1 ]] ; then
	echo -e "\nUsage: $0  <song-name>\n"
	exit
fi

song_name="$1"

#q2
if [[ $(grep -w "$song_name" $info_file | wc -l) -eq 1 ]] ; then
	 echo -e "The song $song_name is in the album\n"
else
	echo -e "The song $song_name is not in the album\n"
	exit
fi

#q3
file_name="tmp/Abbey_Road/"$(grep -w "$song_name $info_file | cut f2)

if [[ ! -f $file_name ]] ; then
	echo -e "\nFile $file_name not found\n"
	exit
fi

#q4
echo -e "The number of lines: "$(tail -n +3 $file_name | wc -l)

#q5
echo -e "The number of words: "$(tail -n +3 $file_name | wc -w)

#q6
echo -e  "The first line in the song is: " $(tail -n +3 | head -n1)

#q7
echo -e "The word that is repeated most often is: " | $(tail -n +3 $file_name | tr " " "\n" |sort | uniq -c | sort -rn | head -n1)
