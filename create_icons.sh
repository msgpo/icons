#!/bin/bash

height=42

# cleanup
rm -r "tmp"
mkdir -p "tmp"
rm -r "rendered"
mkdir -p "rendered"

# create all dynamic svgs
for i in light,6B6B6B dark,C0C0C0; do
  IFS=","
  set -- $i
  destination=$1
  color=$2
  ( ./create_aspectratio.sh $height $color $destination )
  ( ./create_audio_channels.sh $height $color $destination )
  ( ./create_container.sh $height $color $destination )
  ( ./create_source.sh $height $color $destination )
  ( ./create_video_format.sh $height $color $destination )

  # create all predefined icons
  ( ./create_certification.sh $height $color $destination )
  ( ./create_audio_codec.sh $height $color $destination )
  ( ./create_source.sh $height $color $destination )
  ( ./create_video_codec.sh $height $color $destination )
done
