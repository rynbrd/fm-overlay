# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

UBUNTU_PN="${PN%4}"
UBUNTU_PV="${PV}-0ubuntu1"
UBUNTU_P="${UBUNTU_PN}_${PV}"

DESCRIPTION="Compiz config KDE backend."
HOMEPAGE="https://launchpad.net/libcompizconfig-backend-kconfig"
SRC_URI="https://launchpad.net/ubuntu/precise/+source/${UBUNTU_PN}/${UBUNTU_PV}/+files/${UBUNTU_P}.orig.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	x11-libs/qt-dbus:4
	>=x11-wm/compiz-${PV}[kde]
	>=x11-libs/libcompizconfig-${PV}.0"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		"-DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON"
	)
	cmake-utils_src_configure
}

