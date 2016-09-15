#!/bin/bash
BRANCH="master"
pushd .
cd ./X86-64/native/debian
./common-build.sh $BRANCH
popd
