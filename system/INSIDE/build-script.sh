#!/bin/sh
echo "--"
echo $*
echo "--"

BRANCH=$1
DESTARCH=$2
PLATFORM=$3
FORMAT=$4

ARCH=`/usr/bin/arch`

echo "ARCH = $ARCH"
echo "DESTARCH = $DESTARCH"
mkdir /GIT
cd /GIT

if [ -d linux-stable ] ; then
   echo "linux-stable already there"
 else
   git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
fi

if [ -d objoo-linux-kernels-configs ] ; then
   echo "configs already there"
 else
   git clone https://github.com/objoo/custom-linux-kernel-configs.git
fi

MYBRANCH=my-$BRANCH-$DESTARCH-$PLATFORM`date +%s`

cd /GIT/custom-linux-kernel-configs
git pull


cd /GIT/linux-stable
git fetch origin
git branch $MYBRANCH origin/$BRANCH
git checkout $MYBRANCH

ccache -F 0
ccache -M 0

for iteration in  /GIT/custom-linux-kernel-configs/$BRANCH-$DESTARCH-$PLATFORM/*
do
  cp $iteration .config
#  /usr/bin/make-kpkg -j$NBCPU --initrd kernel_image kernel_headers
  /script-$FORMAT-$ARCH-$DESTARCH-$PLATFORM.sh

done

mv /GIT/*deb /RESULT

git checkout master
git branch -D $MYBRANCH
