#!/usr/local/bin/bash -x

set -e

function convert2sec () {
	IFS=":"; read -a hhmmss <<< "$1";
	sec=$((60*60*${hhmmss[0]}+60*${hhmmss[1]}+${hhmmss[2]}))
	echo ${sec}
}

echo "Input file: $1"
echo "Split time file: $2"

ext=${1##*.}
ctr=1

while read line
do
	OUTFILE="${ctr}.${ext}"
	echo "${line}"
	IFS=' '; read -a fields <<< "$line";
	start_sec=$(convert2sec ${fields[0]})
	end_sec=$(convert2sec ${fields[1]})
	ffmpeg -y -i ${1} -ss ${start_sec} -to ${end_sec} ${OUTFILE} < /dev/null 2> /dev/null
	((ctr++))
done < "$2"
