#!/bin/bash
BRANCH="linux-4.1.y"
pushd .
cd ./system
./common-build.sh $BRANCH
popd
