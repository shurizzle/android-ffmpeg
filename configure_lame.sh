#!/bin/bash
pushd `dirname $0`
. settings.sh

pushd lame

rm config.cache

NDK_LIB="${NDK_SYSROOT}/usr/lib"
NDK_INCLUDE="${NDK_SYSROOT}/usr/include"
NDK_PREFIX="${NDK_TOOLCHAIN_BASE}/bin/arm-linux-androideabi-"
NDK_LIBGCC="${NDK_TOOLCHAIN_BASE}/lib/gcc/arm-linux-androideabi/4.4.3/libgcc.a"

export CC="${NDK_PREFIX}gcc"
export CFLAGS="-I${NDK_INCLUDE} -g -std=c99 -O3 -fpic -DANDROID -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing -finline-limit=300"
export LDFLAGS="-Wl,-rpath-link=${NDK_LIB} -L${NDK_LIB} -nostdlib -lc -lm -ldl -llog"
export CPP="${CC} -I${NDK_INCLUDE} -E"

./configure \
  --disable-gtktest \
  --host=arm-linux \
  --disable-frontend \
  --disable-decoder \
  --disable-shared \
  --enable-static \
  --prefix="`pwd`/android"

popd;popd
