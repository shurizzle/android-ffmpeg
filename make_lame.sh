#!/bin/bash
pushd `dirname $0`
. settings.sh
pushd lame
make -j4 install
popd;popd
