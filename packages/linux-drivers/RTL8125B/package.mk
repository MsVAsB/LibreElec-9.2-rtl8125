# Created by MsV
# Copyright (C) 2021

PKG_NAME="RTL8125B"
PKG_VERSION="5.1.16"
PKG_SHA256="139d1d5f6d863f1b02610de252b0739a5c15bbc53d1ff5e7c4e34dd650ecbd38"
# PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/awesometic/realtek-r8125-dkms/"
PKG_URL="http://80.251.144.40/update/RTL8125B-5.1.16.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtec RTL8125 driver for Linux kernel 5.1.16"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

#make_target() {
#  kernel_make KDIR=$(kernel_path)
# cd $PKG_BUILD
#   bash autorun.sh
#  make V=1 \
#       ARCH=$TARGET_KERNEL_ARCH \
#       KSRC=$(kernel_path) \
#       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
#       CONFIG_POWER_SAVING=n
#}

makeinstall_target() {
 cd $PKG_BUILD
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp src/*.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
