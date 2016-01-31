#!/bin/sh
echo $1

mkdir ../build
mkdir ../build/GIT
mkdir ../build/RESULT 
mkdir ../build/CCACHE
docker build  	--build-arg https_proxy=$http_proxy \
		--build-arg http_proxy=$http_proxy -t dsiun/kernel-build .
docker run -i   --env https_proxy=$http_proxy \
		--env http_proxy=$http_proxy \
		-v $PWD/../build/GIT:/GIT -v $PWD/../build/RESULT:/RESULT -v $PWD/../build/CCACHE:/root/.ccache  \
		-t dsiun/kernel-build $1
		
