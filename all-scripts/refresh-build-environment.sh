#!/bin/bash
BRANCH=NOT-OF-ANY-USAGE
pushd .
cd ./X86-64/native/debian
./only-build-new-docker-image.sh $BRANCH
popd
