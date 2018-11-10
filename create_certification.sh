#!/bin/bash

height=$1
color=$2
destination=$3

# cleanup
rm -r "tmp/$destination/certification"
mkdir -p "tmp/$destination/certification"
rm -r "rendered/$destination/certification"
mkdir -p "rendered/$destination/certification"

cp -R "src/certification" "tmp/$destination/"

for file in "tmp/$destination/certification"/*
do
filename=${file##*/}
  # change color in the svg
  sed -i -e "s/{color}/$color/g" $file
  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/certification/${filename%.*}.png" -h $height $file
done
