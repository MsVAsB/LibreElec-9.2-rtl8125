# Created by MsV
# Copyright (C) 2021

PKG_NAME="RTL8125B"
PKG_VERSION="9.005.01"
PKG_SHA256="6a1e07b0eee5424a197f2b8fa0da25a4ec097550747f0c235c647f390eab6707"
# PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/awesometic/realtek-r8125-dkms/"
PKG_URL="http://80.251.144.40/update/RTL8125B-9.005.01.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtec RTL8125 driver for Linux"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
#  kernel_make KDIR=$(kernel_path)
# cd $PKG_BUILD
#   bash autorun.sh
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
 cd $PKG_BUILD
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp src/*.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
