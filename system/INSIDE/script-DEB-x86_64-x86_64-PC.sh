#!/usr/bin/env bash
NBCPU=`cat /proc/cpuinfo  | grep processor | tail -1 | awk '{print $3}'`
echo "$NBCPU processors used for compilation."

#/usr/bin/make-kpkg -j$NBCPU --initrd kernel_image kernel_headers
scripts/config --disable DEBUG_INFO
make deb-pkg -j$NBCPU
