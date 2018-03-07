#!/bin/bash

height=$1

# cleanup
rm "src/video/format/*.svg"
rm -r "rendered/video/format"
mkdir -p "rendered/video/format"

while read -r line
do
  # create the svgs on the fly
  filename="src/video/format/$line.svg"
  cp "src/video_format.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 80 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/video/format/$line.png" -h $height $filename
done < "src/video_format.txt"
