#!/bin/bash
BRANCH="linux-3.18.y"
pushd .
cd ./system
./common-build.sh $BRANCH
popd
