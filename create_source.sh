#!/bin/bash

height=$1

# cleanup
rm -r "rendered/source"
mkdir -p "rendered/source"

for file in "src/source"/*
do
filename=${file##*/}
  # and render them to png (needs inkscape)
  inkscape -z -e "rendered/source/${filename%.*}.png" -h $height $file
done
