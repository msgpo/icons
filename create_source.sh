#!/bin/bash

height=$1
color=$2
destination=$3

# cleanup
rm -r "tmp/$destination/source"
mkdir -p "tmp/$destination/source"
rm -r "rendered/$destination/source"
mkdir -p "rendered/$destination/source"

cp -R "src/source" "tmp/$destination/"

for file in "tmp/$destination/source"/*
do
filename=${file##*/}
  # change color in the svg
  sed -i -e "s/{color}/$color/g" $file
  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/source/${filename%.*}.png" -h $height $file
done
