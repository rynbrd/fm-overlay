# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

DESCRIPTION="Compiz GConf configuration backend."
HOMEPAGE="https://launchpad.net/libcompizconfig-backend-gconf"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/compizconfig-backend-gconf_0.9.5.92.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=gnome-base/gconf-2.0
	>=x11-libs/libcompizconfig-${PV}"

RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		"-DCMAKE_MODULE_PATH=/usr/share/compiz/cmake"
		"-DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON"
	)
	cmake-utils_src_configure
}

