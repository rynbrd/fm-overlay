# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PKG="boomerang___gtk3_by_ghogaru-d34mspx.zip"

DESCRIPTION="Boomerang GTK2/3 Theme"
HOMEPAGE="http://ghogaru.deviantart.com/art/Boomerang-GTK3-189180645"
SRC_URI="http://www.deviantart.com/download/189180645/${MY_PKG}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-themes/gtk-engines-murrine"

S="${WORKDIR}/Boomerang_GTK_by ghogaru"

install_theme() {
	NAME=$(basename "$1")
	cd "$1"
}

src_unpack() {
	unpack "$MY_PKG"
	cd "$S"
	tar -xf Boomerang.tar.gz
	tar -xf Boomerang-Deux.tar.gz
}

src_prepare() {
	cd "$S"
	rm $(find ./ -name '*~')
}

src_install() {
	THEMES="/usr/share/themes"
	DOCS="/usr/share/doc/${P}"
	dodir "$THEMES"
	cp -rf "${S}/Boomerang" "${D}${THEMES}/"
	cp -rf "${S}/Boomerang-Deux" "${D}${THEMES}/"
	dodir "$DOCS"
	insinto	"$DOCS"
	doins "${S}/ChangeLog"
	doins "${S}/COPYING"
	doins "${S}/README"
}

