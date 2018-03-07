#!/bin/bash

height=$1

# cleanup
rm -r "rendered/video/codec"
mkdir -p "rendered/video/codec"

for file in "src/video/codec"/*
do
filename=${file##*/}
  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/video/codec/${filename%.*}.png" -h $height $file
done
