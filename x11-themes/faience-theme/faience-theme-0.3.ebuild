# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PKG="gnome_shell___faience_by_tiheum-d47vmgg.zip"

DESCRIPTION="Faience Gnome-Shell theme."
HOMEPAGE="http://tiheum.deviantart.com/art/Gnome-Shell-Faience-255097456"
SRC_URI="http://www.deviantart.com/download/255097456/${MY_PKG}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	THEMES="/usr/share/themes"
	dodir "$THEMES"
	cp -rf "${S}/Faience" "${D}${THEMES}/"
}

