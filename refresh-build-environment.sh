#!/bin/bash
BRANCH=NOT-OF-ANY-USAGE
pushd .
cd ./system
./only-build-new-docker-image.sh $BRANCH
popd
