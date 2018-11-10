#!/bin/bash

height=$1
color=$2
destination=$3

# cleanup
rm -r "tmp/$destination/video/format"
mkdir -p "tmp/$destination/video/format"
rm -r "rendered/$destination/video/format"
mkdir -p "rendered/$destination/video/format"

while read -r line
do
  # create the svgs on the fly
  filename="tmp/$destination/video/format/$line.svg"
  cp "src/video_format.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 80 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename
  sed -i -e "s/{color}/$color/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/video/format/$line.png" -h $height $filename
done < "src/video_format.txt"
