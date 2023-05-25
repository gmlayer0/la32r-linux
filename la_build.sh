#!/bin/bash

export CROSS_COMPILE=loongarch32r-linux-gnusf-
export ARCH=loongarch
OUT=la_build

if [ ! -d la_build ] ;then
    mkdir la_build
fi

echo "----------------output ${OUT}----------------"

make la32_defconfig O=${OUT}
make menuconfig O=${OUT}
make vmlinux -j  O=${OUT} 2>&1 | tee -a build_error.log
cp la_build/vmlinux ../qemu_work/vmlinux
