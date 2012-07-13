#!/bin/bash
pushd `dirname $0`
. settings.sh

find . -name \*.o -delete

pushd x264
make clean
popd

pushd lame
make clean
rm -rf android
popd

pushd ffmpeg
make clean
popd
