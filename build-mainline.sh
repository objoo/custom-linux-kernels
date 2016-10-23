#!/bin/bash
BRANCH="linux-4.8.y"
pushd .
cd ./system
./common-build.sh $BRANCH
popd
