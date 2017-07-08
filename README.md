# VideoSplitter by Satoru Tagawa
Bash script to split a video file into multiple files, using ffmpeg

Usage: split_video.sh <input_video> <split_times.txt>

split_times.txt is a text file, with each line containing the position from where to start and stop the cropping.
Example file content:
0:00:00 0:00:03
0:01:00 0:01:03
0:02:00 0:02:03

See run_split_video.sh for an example of how to run the splitter

Notes:
1) Requires ffmpeg installed in path
2) bash is set to /usr/local/bin/bash, but probably normally in /bin/bash
3) Tested on MacOS 10.12.5 Sierra on MacBook (Early 2015)
4) Only mp4 is tested, but should work for any other formats supported by ffmpeg
