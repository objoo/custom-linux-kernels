#!/bin/bash
## BRANCH=$1
##DESTARCH=$2
##PLATFORM=$3
##FORMAT=$4

BRANCH="master"
pushd .
cd ./system
./common-build.sh $BRANCH arm BANANA UIMAGE
popd
