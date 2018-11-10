#!/bin/bash

height=$1
color=$2
destination=$3

# cleanup
rm -r "tmp/$destination/audio/codec"
mkdir -p "tmp/$destination/audio/codec"
rm -r "rendered/$destination/audio/codec"
mkdir -p "rendered/$destination/audio/codec"

cp -R "src/audio/codec" "tmp/$destination/audio/"

for file in "tmp/$destination/audio/codec"/*
do
filename=${file##*/}
  # change color in the svg
  sed -i -e "s/{color}/$color/g" $file
  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/$destination/audio/codec/${filename%.*}.png" -h $height $file
done
