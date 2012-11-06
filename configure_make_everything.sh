#!/bin/bash

function die {
  echo "$1 failed" && exit 1
}

./clean.sh
./configure_x264.sh || die "X264 configure"
./make_x264.sh || die "X264 make"
./configure_lame.sh || die "lame configure"
./make_lame.sh || die "lame make"
./configure_ffmpeg.sh || die "FFMPEG configure"
./make_ffmpeg.sh || die "FFMPEG make"
cp ffmpeg/ffmpeg ffmpeg-bin
