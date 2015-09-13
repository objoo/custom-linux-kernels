#!/bin/sh
echo $PWD
mkdir ../build
mkdir ../build/GIT
mkdir ../build/RESULT 
docker build -t objoo/arm-cross .
docker run -i -v $PWD/../build/GIT:/GIT -v $PWD/../build/RESULT:/RESULT -t objoo/arm-cross 
