# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_PN="Shiki Empire"

DESCRIPTION="Shiki Empire Emerald Theme"
HOMEPAGE=""
SRC_URI="http://www.dev.fatedmariner.org/Shiki_Empire.emerald"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-wm/emerald"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_unpack() {
	tar -xzf ${DISTDIR}/${A}
}

src_install() {
	dodir "/usr/share/emerald"
	dodir "/usr/share/emerald/themes"
	dodir "/usr/share/emerald/themes/${MY_PN}"
	insinto "/usr/share/emerald/themes/${MY_PN}"
	doins *.png
	doins theme.ini
}

