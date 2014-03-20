# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools eutils

DESCRIPTION="Small daemon for disableing trackpads while typing."
HOMEPAGE="https://github.com/BlueDragonX/dispad"
SRC_URI="https://github.com/BlueDragonX/dispad/tarball/v${PV/_/-} -> ${P}.tar.gz"

S="${WORKDIR}/BlueDragonX-dispad-gd91273d"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=x11-libs/libX11-1.4.1
	>=x11-libs/libXi-1.4.1
	>=dev-libs/confuse-2.6-r3"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf -i
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

