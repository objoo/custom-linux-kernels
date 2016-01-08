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

MYBRANCH=my-linux-$BRANCH-`date +%s`

cd /GIT/dsiun-linux-kernels-configs
git pull


cd /GIT/linux-stable
git checkout linux-$BRANCH
git branch $MYBRANCH linux-$BRANCH
git pull
git checkout $MYBRANCH

NBCPU=`cat /proc/cpuinfo  | grep processor | tail -1 | awk '{print $3}'`
echo "$NBCPU processors used for compilation."

for iteration in  /GIT/dsiun-linux-kernels-configs/$BRANCH/*
do
  cp $iteration .config
  /usr/bin/make-kpkg -j$NBCPU --initrd kernel_image kernel_headers

done

mv /GIT/*deb /RESULT
