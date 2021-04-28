# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="rtl8125b-firmware"
PKG_VERSION="rtl8125b"
PKG_SHA256="1a5094a852aa141f2a281e117b3fbd6bd8888bf70b80c26b107e3bd97cb742e3"
PKG_LICENSE="Free-to-use"
PKG_SITE="http://80.251.144.40/LibreELEC/wlan-firmware"
PKG_URL="http://80.251.144.40/update/rtl8125b-firmware.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="rtl8125b-firmware: firmwares for RTL8125B drivers"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  DESTDIR=$INSTALL/$(get_kernel_overlay_dir) ./install
}
