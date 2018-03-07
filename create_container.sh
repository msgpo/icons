#!/bin/bash

height=$1

# cleanup
rm "src/container/*.svg"
rm -r "rendered/container"
mkdir -p "rendered/container"

while read -r line
do
  # create the svgs on the fly
  filename="src/container/${line,,}.svg"
  cp "src/container.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 100 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/container/${line,,}.png" -h $height $filename
done < "src/container.txt"
