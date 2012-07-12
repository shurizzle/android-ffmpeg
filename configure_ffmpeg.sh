#!/bin/bash
pushd `dirname $0`
. settings.sh

if [[ $DEBUG == 1 ]]; then
  echo "DEBUG = 1"
  DEBUG_FLAG="--disable-stripping"
fi

pushd ffmpeg

#--disable-decoders \
#--disable-encoders \
#--disable-muxers \
#--disable-demuxers \
#--disable-parsers \
#--disable-filters \
#--disable-protocols \
##--enable-yasm \
##--enable-small \
##--enable-hwaccels \
##--enable-small \
##--cpu=cortex-a8 \
##--enable-runtime-cpudetect \
##--enable-libfaac \
##--enable-nonfree
##--extra-cflags="-I../x264 -I../faac/include" \
##--extra-ldflags="-L../x264 -L../faac/libfaac/.libs" \

./configure \
$DEBUG_FLAG \
--enable-cross-compile \
--arch=arm \
--enable-hwaccels \
--target-os=linux \
--prefix=/data/data/org.witness.sscvideoproto \
--enable-pic \
--disable-shared \
--enable-static \
--cross-prefix=$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi- \
--sysroot="$NDK_SYSROOT" \
--enable-version3 \
--enable-gpl \
--enable-memalign-hack \
--disable-yasm \
--disable-doc \
\
--enable-decoder=mjpeg \
--enable-decoder=rawvideo \
\
--enable-encoder=libx264 \
--enable-encoder=libfaac \
--enable-decoder=h263 \
--enable-decoder=mpeg4 \
--enable-decoder=h264 \
--enable-parser=h264 \
\
--enable-muxer=mp4 \
\
--enable-demuxer=image2 \
--enable-demuxer=mjpeg \
--enable-demuxer=mp4 \
--enable-demuxer=mov \
--enable-demuxer=h264 \
--enable-parser=mjpeg \
--enable-filter=buffer \
--enable-filter=buffersink \
--enable-filter=drawbox \
--enable-filter=overlay \
--enable-filter=redact \
--enable-protocol=file \
--enable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-network \
--enable-libx264 \
--enable-zlib \
--extra-cflags="-I../x264" \
--extra-ldflags="-L../x264" \
--disable-avdevice \
--disable-devices

popd; popd


