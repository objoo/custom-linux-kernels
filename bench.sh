#!/bin/bash
## BRANCH=$1
##DESTARCH=$2
##PLATFORM=$3
##FORMAT=$4

BRANCH="linux-4.0.y"
pushd .
cd ./system
time ./common-build.sh $BRANCH x86_64 PC DEB
popd
