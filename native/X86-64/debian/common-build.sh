#!/bin/sh
echo $1 $2

mkdir ../build
mkdir ../build/GIT
mkdir ../build/RESULT 
mkdir ../build/CCACHE
case $2 in
CLEAN* )
  echo "building new up to date environment."
  docker build --no-cache=true 	--build-arg https_proxy=$http_proxy \
				--build-arg http_proxy=$http_proxy -t dsiun/kernel-build .
  ;;
*)
  echo "using cached environment."
  docker build    --build-arg https_proxy=$http_proxy \
                  --build-arg http_proxy=$http_proxy -t dsiun/kernel-build .
    ;;
esac

case $2 in

CLEANONLY)
   echo "new build image ready."
;;
*)
docker run -i   --env https_proxy=$http_proxy \
		--env http_proxy=$http_proxy \
		-v $PWD/../build/GIT:/GIT -v $PWD/../build/RESULT:/RESULT -v $PWD/../build/CCACHE:/root/.ccache  \
		-t dsiun/kernel-build $1
		
;;
esac
