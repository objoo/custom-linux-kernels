#!/bin/bash
BRANCH="master"
pushd .
cd ./system
./common-build.sh $BRANCH
popd
