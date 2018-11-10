#!/bin/bash

height=$1
color=$2
destination=$3

# cleanup
rm -r "tmp/$destination/container"
mkdir -p "tmp/$destination/container"
rm -r "rendered/$destination/container"
mkdir -p "rendered/$destination/container"

while read -r line
do
  # create the svgs on the fly
  filename="tmp/$destination/container/${line,,}.svg"
  cp "src/container.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 100 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename
  sed -i -e "s/{color}/$color/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/container/${line,,}.png" -h $height $filename
done < "src/container.txt"
