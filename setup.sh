#!/bin/sh

git submodule init
git submodule update
wget http://ffmpeg.org/releases/ffmpeg-0.8.12.tar.bz2
tar xvf ffmpeg-0.8.12.tar.bz2
mv ffmpeg-0.8.12 ffmpeg
rm ffmpeg-0.8.12.tar.bz2
wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
tar xvf lame-3.99.5.tar.gz
mv lame-3.99.5 lame
rm lame-3.99.5.tar.gz
