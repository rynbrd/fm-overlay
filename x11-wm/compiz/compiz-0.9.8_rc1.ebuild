# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PV="0.9.8"

SRC_URI=""
EBZR_REPO_URI="http://bazaar.launchpad.net/~compiz-team/compiz/${MY_PV}"
EBZR_REVISION="3262"

inherit eutils bzr cmake-utils gnome2-utils flag-o-matic

DESCRIPTION="OpenGL compositing window manager."
HOMEPAGE="https://launchpad.net/compiz"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+cairo fuse gnome gtk kde +svg dbus"

COMMONDEPEND="
	!x11-wm/compiz-fusion
	!x11-libs/compiz-bcop
	!x11-libs/libcompizconfig
	!x11-libs/compizconfig-backend-gconf
	!x11-libs/compizconfig-backend-kconfig4
	!x11-libs/compiz-plugins-main
	!x11-libs/compiz-plugins-extra
	!x11-libs/compiz-plugins-unsupported
	!x11-apps/ccsm
	!dev-python/compizconfig-python
	>=dev-libs/boost-1.34.0
	>=dev-libs/glib-2.30.0
	dev-libs/libxml2
	dev-libs/libxslt
	media-libs/libpng
	>=media-libs/mesa-6.5.1-r1
	>=x11-base/xorg-server-1.1.1-r1
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXrandr
	>=x11-libs/libXrender-0.9.3
	x11-libs/libXinerama
	x11-libs/libICE
	x11-libs/libSM
	>=x11-libs/startup-notification-0.7
	cairo? (
		x11-libs/cairo[X]
	)
	fuse? ( sys-fs/fuse )  
	gtk? (
		>=x11-libs/gtk+-2.18.0
		>=x11-libs/libwnck-2.19.4
		x11-libs/pango
		gnome? (
			gnome-base/gnome-desktop
			gnome-base/gconf
			>=x11-wm/metacity-2.23.2
		)
	)
	kde? (
		|| (
			>=kde-base/kwin-4.2.0
			kde-base/kwin:live
		)
	)
	svg? (
		>=gnome-base/librsvg-2.14.0:2
		>=x11-libs/cairo-1.0
	)
	dbus? ( >=sys-apps/dbus-1.0 )"

DEPEND="${COMMONDEPEND}
	app-admin/chrpath
	dev-util/pkgconfig
	x11-proto/damageproto
	x11-proto/xineramaproto
	dev-cpp/gtest
	dev-cpp/gmock"

RDEPEND="${COMMONDEPEND}
	x11-apps/mesa-progs
	x11-apps/xvinfo"

src_unpack() {
	bzr_src_unpack
}

src_prepare() {
	bzr_src_prepare

	epatch "${FILESDIR}/${P}-sandbox.patch"
	epatch "${FILESDIR}/${P}-ccsm-setup.patch"

	echo "gtk/gnome/compiz-wm.desktop.in" >> "${S}/po/POTFILES.skip"
	echo "metadata/core.xml.in" >> "${S}/po/POTFILES.skip"

	if use kde; then
		$(has_version ">=kde-base/kwin-4.8") && \
			epatch "${FILESDIR}/${P}-kde-4.8.patch"
	fi
}

src_configure() {
	local mycmakeargs=(
		"$(cmake-utils_use_use gnome GCONF)"
		"$(cmake-utils_use_use gnome GNOME)"
		"$(cmake-utils_use_use gtk GTK)"
		"$(cmake-utils_use_use kde KDE4)"
		"-DCMAKE_C_FLAGS="
		"-DCMAKE_CXX_FLAGS="
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
	pushd ${CMAKE_BUILD_DIR}
	dodir /usr/share/cmake/Modules
	emake DESTDIR="${D}" findcompiz_install
	emake DESTDIR="${D}" install
	popd ${CMAKE_BUILD_DIR}
	chrpath -d "${D}/usr/lib64/python2.7/site-packages/compizconfig.so"
}

pkg_preinst() {
	use gnome && gnome2_gconf_savelist
}

pkg_postinst() {
	use gnome && gnome2_gconf_install
}

pkg_prerm() {
	use gnome && gnome2_gconf_uninstall
}

