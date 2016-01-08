#!/bin/sh
BRANCH="4.1.y"

echo $PWD
mkdir ../build
mkdir ../build/GIT
mkdir ../build/RESULT 
mkdir ../build/CCACHE
docker build -t dsiun/kernel-build .
docker run -i -v $PWD/../build/GIT:/GIT -v $PWD/../build/RESULT:/RESULT -v $PWD/../build/CCACHE:/root/.ccache -t dsiun/kernel-build $BRANCH
