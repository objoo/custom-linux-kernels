#!/usr/bin/env bash
NBCPU=`cat /proc/cpuinfo  | grep processor | tail -1 | awk '{print $3}'`
echo "$NBCPU processors used for compilation."

make -j$NBCPU  ARCH=arm CROSS_COMPILE=arm-none-eabi- LOADADDR=0x40008000 uImage modules dtbs

ARCH=arm CROSS_COMPILE=arm-none-eabi- INSTALL_MOD_STRIP=1 make modules_install

tar cvfz /RESULT/result.tar.gz arch/arm/boot /lib/modules/*