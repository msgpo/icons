#!/bin/bash

height=$1

# cleanup
rm "src/audio/channels/*.svg"
rm -r "rendered/audio/channels"
mkdir -p "rendered/audio/channels"

while read -r line
do
  # create the svgs on the fly
  filename="src/audio/channels/${line}ch.svg"
  cp "src/audio_channels.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 80 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/audio/channels/${line}ch.png" -h $height $filename
done < "src/audio_channels.txt"
