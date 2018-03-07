#!/bin/bash

height=28

# create all dynamic svgs
( ./create_aspectratio.sh $height )
( ./create_audio_channels.sh $height )
( ./create_container.sh $height )
( ./create_source.sh $height )
( ./create_video_format.sh $height )

# create all predefined icons
( ./create_audio_codec.sh $height )
( ./create_source.sh $height )
( ./create_video_codec.sh $height )
