#!/bin/sh
echo $PWD
mkdir ../build
mkdir ../build/GIT
mkdir ../build/RESULT 
mkdir ../build/CCACHE
docker build -t objoo/arm-cross .
docker run -i -v $PWD/../build/GIT:/GIT -v $PWD/../build/RESULT:/RESULT -v $PWD/../build/CCACHE:/root/.ccache --entrypoint="./inside-script-latest-mainline.sh" -t objoo/arm-cross
