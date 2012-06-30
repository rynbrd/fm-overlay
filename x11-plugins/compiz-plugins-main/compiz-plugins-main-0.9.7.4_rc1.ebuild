# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PV="0.9.7"

SRC_URI=""
EBZR_REPO_URI="http://bazaar.launchpad.net/~compiz-team/compiz-plugins-main/${MY_PV}"
EBZR_REVISION="33"

inherit bzr cmake-utils

DESCRIPTION="Compiz main plugins collection."
HOMEPAGE="https://launchpad.net/compiz-plugins-main/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMONDEPEND="
	~x11-wm/compiz-0.9.7
	!x11-plugins/compiz-fusion-plugins-main
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

src_unpack() {
	bzr_src_unpack
}

src_prepare() {
	bzr_src_prepare
}

src_configure() {
	local mycmakeargs=(
		"-DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON"
		"-DCOMPIZ_PACKAGING_ENABLED=ON"
		"-DCOMPIZ_DESTDIR=${D}"
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	export DESTDIR="${D}"
	cmake-utils_src_install
}

