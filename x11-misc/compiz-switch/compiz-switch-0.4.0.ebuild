# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Compiz-Switch is a simple program to switch Compiz off and on
easily."
HOMEPAGE="http://forlong.blogage.de/article/pages/Compiz-Switch"
SRC_URI="http://blogage.de/files/3531/download?${P}%7Esource.tar.gz"
S="${WORKDIR}/${P}~source"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-wm/compiz"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/install.patch"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

