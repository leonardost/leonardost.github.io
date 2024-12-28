#!/bin/bash

set -e

post="$1"

echo $post

for file in `ls -1 $post*`
do
	# echo $file
	filename="${file%.*}"
	extension="${file##*.}"
	# echo $filename
	# echo $extension
	echo ${filename}-resized.${extension}
	magick $file -resize 704x ${filename}-resized.${extension}
done

