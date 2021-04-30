# Created by MsV
# Copyright (C) 2021

PKG_NAME="RTL8125B"
PKG_VERSION="cb398363f11d742d880b8bb80763d050f00e7e98"
PKG_SHA256="8f05052c59e69a8bf0ada420d25ef29f54a38d25e0fd841e9df9e61145a48f55"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/awesometic/realtek-r8125-dkms/"
PKG_URL="https://github.com/awesometic/realtek-r8125-dkms/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtek RTL8125 driver for Linux"
PKG_IS_KERNEL_PKG="yes"

make_target() {
  kernel_make V=1 \
       -C $(kernel_path) \
       M="$PKG_BUILD/src"
}

makeinstall_target() {
 cd $PKG_BUILD
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp src/*.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
