#!/bin/bash 

#ffmpeg -f concat -safe 0 -i <(printf "file $PWD/ZO090006.MOV\nfile $PWD/ZO100006.MOV\n") -c copy 9_10.MOV
#ffmpeg -f concat -safe 0 -i mylist.txt -c copy 2_5.MOV
ffmpeg -f concat -safe 0 -i <(printf "file $PWD/BlackSwan1.MOV\nfile $PWD/BlackSwan2.MOV\n") -c copy BlackSwan.MOV
