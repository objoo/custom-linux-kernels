#!/bin/sh
BRANCH="4.1.y"
pushd .
cd ./X86-64/native/debian
./common-build.sh $BRANCH
popd
