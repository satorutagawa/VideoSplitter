#!/bin/bash -x

set -e

function convert2sec () {
	IFS=":"; read -a hhmmss <<< "$1";
	sec=$((60*60*10#${hhmmss[0]}+60*10#${hhmmss[1]}+10#${hhmmss[2]}))
	echo ${sec}
}

echo "Input file: $1"
echo "Split time file: $2"

ext=${1##*.}
fname=${1%.*}
ctr=1

while read line
do
	OUTFILE="${fname}_${ctr}.${ext}"

#	echo "${line}"
	IFS=' '; read -a fields <<< "$line";

	# Convert 0:10:03 to 603 seconds
	start_sec=$(convert2sec ${fields[0]})
	end_sec=$(convert2sec ${fields[1]})

	# split file
	time ffmpeg -y -i ${1} -vcodec copy -acodec copy -ss ${start_sec} -to ${end_sec} ${OUTFILE} < /dev/null 2> /dev/null

	# Using sem to run multiple instances of ffmpeg. Not any faster
	#sem -j+0 ffmpeg -y -i ${1} -ss ${start_sec} -to ${end_sec} ${OUTFILE} < /dev/null 2> /dev/null ";" echo done

	((ctr++))
done < "$2"
#sem --wait
