# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

MY_PV="0.9.7"

DESCRIPTION="Compiz main plugins collection."
HOMEPAGE="https://launchpad.net/compiz-plugins-main/"
SRC_URI="https://launchpad.net/compiz-plugins-main/${MY_PV}/${PV}/+download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMONDEPEND="
	!x11-plugins/compiz-fusion-plugins-main
	>=x11-wm/compiz-${PV}
	>=gnome-base/librsvg-2.14.0
	media-libs/libjpeg-turbo
	x11-libs/cairo"

DEPEND="${COMMONDEPEND}
	>=dev-util/pkgconfig-0.19
	>=dev-util/intltool-0.35
	>=sys-devel/gettext-0.15
	dev-cpp/gtest
	dev-cpp/gmock"

RDEPEND="${COMMONDEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_CXX_FLAGS=-fno-strict-aliasing"
		"-DCMAKE_MODULE_PATH=/usr/share/compiz/cmake"
		"-DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON"
	)
	cmake-utils_src_configure
}

