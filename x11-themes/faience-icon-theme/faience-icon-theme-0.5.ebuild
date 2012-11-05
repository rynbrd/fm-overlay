# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PKG="faience-icon-theme_0.5.zip"

DESCRIPTION="Faience icon theme."
HOMEPAGE="http://tiheum.deviantart.com/art/Faience-icon-theme-255099649"
SRC_URI="http://dl.dropbox.com/u/9966975/${MY_PKG}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack "$MY_PKG"
	cd "$S"
	tar -xf Faience.tar.gz
	tar -xf Faience-Azur.tar.gz
	tar -xf Faience-Claire.tar.gz
	tar -xf Faience-Ocre.tar.gz
}

src_install() {
	ICONS="/usr/share/icons"
	DOCS="/usr/share/doc/${P}"
	dodir "$ICONS"
	cp -rf "${S}/Faience" "${D}${ICONS}"
	cp -rf "${S}/Faience-Azur" "${D}${ICONS}"
	cp -rf "${S}/Faience-Claire" "${D}${ICONS}"
	cp -rf "${S}/Faience-Ocre" "${D}${ICONS}"
	dodir "$DOCS"
	insinto "$DOCS"
	doins "${S}/AUTHORS"
	doins "${S}/ChangeLog"
	doins "${S}/COPYING"
	doins "${S}/README"
}

