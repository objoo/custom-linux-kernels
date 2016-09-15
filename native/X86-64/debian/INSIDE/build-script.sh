#!/bin/sh
echo "--"
echo $*
echo "--"

BRANCH=$1

mkdir /GIT
cd /GIT

if [ -d linux-stable ] ; then
   echo "linux-stable already there"
 else
   git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
fi

if [ -d dsiun-linux-kernels-configs ] ; then
   echo "configs already there"
 else
   git clone https://gitlab.univ-nantes.fr/irts/dsiun-linux-kernels-configs.git
fi

MYBRANCH=my-$BRANCH-`date +%s`

cd /GIT/dsiun-linux-kernels-configs
git pull


cd /GIT/linux-stable
git fetch origin
git branch $MYBRANCH origin/$BRANCH
git checkout $MYBRANCH

NBCPU=`cat /proc/cpuinfo  | grep processor | tail -1 | awk '{print $3}'`
echo "$NBCPU processors used for compilation."

ccache -F 0
ccache -M 0

for iteration in  /GIT/dsiun-linux-kernels-configs/$BRANCH/*
do
  cp $iteration .config
  /usr/bin/make-kpkg -j$NBCPU --initrd kernel_image kernel_headers

done

mv /GIT/*deb /RESULT

git checkout master
git branch -D $MYBRANCH
