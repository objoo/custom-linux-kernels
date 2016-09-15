#!/bin/bash
BRANCH="linux-3.18.y"
pushd .
cd ./X86-64/native/debian
./common-build.sh $BRANCH
popd
