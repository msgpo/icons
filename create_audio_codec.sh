#!/bin/bash

height=$1

# cleanup
rm -r "rendered/audio/codec"
mkdir -p "rendered/audio/codec"

for file in "src/audio/codec"/*
do
filename=${file##*/}
  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/audio/codec/${filename%.*}.png" -h $height $file
done
