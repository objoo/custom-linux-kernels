#!/bin/bash
BRANCH="linux-4.4.y"
pushd .
cd ./system
./common-build.sh $BRANCH
popd
