#!/bin/bash

height=$1
color=$2
destination=$3

# cleanup
rm -r "tmp/$destination/aspectratio"
mkdir -p "tmp/$destination/aspectratio"
rm -r "rendered/$destination/aspectratio"
mkdir -p "rendered/$destination/aspectratio"

while read -r line
do
  # create the svgs on the fly
  filename="tmp/$destination/aspectratio/$line.svg"
  cp "src/aspectratio.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 100 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename
  sed -i -e "s/{color}/$color/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/aspectratio/$line.png" -h $height $filename
done < "src/aspectratios.txt"
