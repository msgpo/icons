#!/bin/bash

height=$1

# cleanup
rm "src/aspectratio/*.svg"
rm -r "rendered/aspectratio"
mkdir -p "rendered/aspectratio"

while read -r line
do
  # create the svgs on the fly
  filename="src/aspectratio/$line.svg"
  cp "src/aspectratio.svg.tmpl" $filename
  sed -i -e "s/{text}/$line/g" $filename
  let "offset = 100 - (${#line} / 2)"
  sed -i -e "s/{x}/$offset/g" $filename

  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/aspectratio/$line.png" -h $height $filename
done < "src/aspectratios.txt"
