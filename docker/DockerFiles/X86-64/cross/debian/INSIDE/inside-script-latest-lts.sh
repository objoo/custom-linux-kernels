#!/bin/sh
cd /GIT
git clone git://git.denx.de/u-boot.git
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

cd /GIT/u-boot
git pull

make Bananapi_defconfig
ARCH=arm CROSS_COMPILE=arm-none-eabi- make

rm -rf /RESULT/*

cp u-boot-sunxi-with-spl.bin /RESULT

cd /GIT/linux-stable
git checkout master
git pull
git checkout v4.1.6

curl -L --retry 20 --retry-delay 2 https://raw.githubusercontent.com/objoo/custom-linux-kernels/master/config/ARM/bananapi/config-4.1-YDoSHM -o .config
make -j3  ARCH=arm CROSS_COMPILE=arm-none-eabi- LOADADDR=0x40008000 uImage modules dtbs

ARCH=arm CROSS_COMPILE=arm-none-eabi- INSTALL_MOD_STRIP=1 make modules_install
tar cvfz /RESULT/modules.tar.gz /lib/modules/*
cp -av /GIT/linux-stable/arch/arm/boot/uImage /RESULT
cp -av /GIT/linux-stable/arch/arm/boot/dts/sun7i-a20-bananapi.dtb /RESULT

