#!/bin/bash

height=$1
color=$2
destination=$3


# cleanup
rm -r "tmp/$destination/video/codec"
mkdir -p "tmp/$destination/video/codec"
rm -r "rendered/$destination/video/codec"
mkdir -p "rendered/$destination/video/codec"

cp -R "src/video/codec" "tmp/$destination/video/"

for file in "tmp/$destination/video/codec"/*
do
filename=${file##*/}
  # change color in the svg
  sed -i -e "s/{color}/$color/g" $file
  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/video/codec/${filename%.*}.png" -h $height $file
done
