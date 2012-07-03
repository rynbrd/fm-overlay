# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git

MY_PV="${PV%.*}"
UBUNTU_R="~bzr428"
UBUNTU_PV="${PV}${UBUNTU_R}-0ubuntu6"
UBUNTU_P="${PN}_${PV}${UBUNTU_R}"
ARCHIVE_PV="0.9.5.94"
ARCHIVE_P="${PN}-${ARCHIVE_PV}"

DESCRIPTION="Compiz configuration libaries."
HOMEPAGE="https://launchpad.net/libcompizconfig"
SRC_URI="https://launchpad.net/ubuntu/precise/+source/libcompizconfig/${UBUNTU_PV}/+files/${UBUNTU_P}.orig.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMONDEPEND="
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/protobuf
	>=x11-wm/compiz-${MY_PV}"

DEPEND="${COMMONDEPEND}
	>=dev-util/pkgconfig-0.19"

RDEPEND="${COMMONDEPEND}"

src_unpack() {
	unpack "${A}"
	S="${WORKDIR}/${ARCHIVE_P}"
}

src_prepare() {
	epatch "${FILESDIR}/${P}-sandbox.patch"
}

src_configure() {
	mycmakeargs=(
		"-DCMAKE_CXX_FLAGS=-fno-strict-aliasing"
		"-DCMAKE_MODULE_PATH=/usr/share/compiz/cmake"
		"-DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON"
		"-DCOMPIZ_DESTDIR=${D}"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
