# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git

MY_PV="0.9.7"
ARCHIVE_PV="0.9.5.94"
ARCHIVE_P="${PN}-${ARCHIVE_PV}"

DESCRIPTION="Compiz configuration libaries."
HOMEPAGE="https://launchpad.net/libcompizconfig"
SRC_URI="https://launchpad.net/ubuntu/precise/+source/libcompizconfig/0.9.7.0~bzr428-0ubuntu6/+files/libcompizconfig_0.9.7.0~bzr428.orig.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMONDEPEND="
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/protobuf
	=x11-wm/compiz-${MY_PV}"

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
		"$(cmake-utils_use_use gnome GCONF)"
		"$(cmake-utils_use_use gnome GNOME)"
		"$(cmake-utils_use_use gnome METACITY)"
		"$(cmake-utils_use_use gtk GTK)"
		"$(cmake-utils_use_use kde KDE4)"
		"-DCMAKE_CXX_FLAGS=-fno-strict-aliasing"
		"-DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON"
		"-DCOMPIZ_DESTDIR=${D}"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

