# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_PN="AwOken"
MY_PV="AwOken-2.3"
DESCRIPTION="AwOken Icon Theme"
HOMEPAGE=""
SRC_URI="http://www.deviantart.com/download/163570862/awoken_by_alecive-d2pdw32.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S=${WORKDIR}

src_unpack {
	unpack ${A}
	unpack "${WORKDIR}/${MY_PV}/${MY_PN}.tar.gz"
}

src_install {
	dobin "${MY_PN}/awoken-icon-theme-customization"
	dobin "${MY_PN}/awoken-icon-theme-customization-clear"
	dodoc "${MY_PN}/Installation_and_Instructions.pdf"
	dodir "/usr/share/icons/${MY_PN}"
	insinto "/usr/share/icons/${MY_PN}"
	doins -r "${MY_PN}/clear"
	doins -r "${MY_PN}/extra"
	doins "${MY_PN}/index.theme"
}

