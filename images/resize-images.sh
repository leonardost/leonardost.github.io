#!/bin/bash

set -e

post="$1"
quality=80

echo $post

for file in `ls -1 $post*`
do
	# echo $file
	filename="${file%.*}"
	extension="${file##*.}"
	# echo $filename
	# echo $extension

	if [ "$extension" = "jpg" ] || [ "$extension" = "jpeg" ]; then
		# For JPG files, reduce quality
		echo ${filename}-resized.${extension}
		magick $file -resize 704x -quality $quality ${filename}-resized.${extension}
	elif [ "$extension" = "png" ]; then
		# For PNG files, convert to JPG with reduced quality
		echo ${filename}-resized.jpg
		magick $file -resize 704x -quality $quality ${filename}-resized.jpg
	else
		# For other formats, just resize
		echo ${filename}-resized.${extension}
		magick $file -resize 704x ${filename}-resized.${extension}
	fi
done

