cd /GIT
git clone git://git.denx.de/u-boot.git
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd u-boot
make Bananapi_defconfig
ARCH=arm CROSS_COMPILE=arm-none-eabi- make
cp u-boot-sunxi-with-spl.bin /RESULT
