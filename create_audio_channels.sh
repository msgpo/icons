#!/bin/bash

height=$1
color=$2
destination=$3

# cleanup
rm -r "tmp/$destination/audio/channels"
mkdir -p "tmp/$destination/audio/channels"
rm -r "rendered/$destination/audio/channels"
mkdir -p "rendered/$destination/audio/channels"

while read -r line
do
  # create the svgs on the fly
  filename="tmp/$destination/audio/channels/${line}ch.svg"
  cp "src/audio_channels.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 80 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename
  sed -i -e "s/{color}/$color/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/audio/channels/${line}ch.png" -h $height $filename
done < "src/audio_channels.txt"
