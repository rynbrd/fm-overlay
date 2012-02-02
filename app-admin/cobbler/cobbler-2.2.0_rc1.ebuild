# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit autotools python git-2

DESCRIPTION="Cobbler Install/Update Server"
HOMEPAGE="http://cobbler.github.com/"

EGIT_REPO_URI="git://github.com/cobbler/cobbler.git"
EGIT_COMMIT="eb89d3256f746b4d3ae0eba43e9d2672e682357b"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

IUSE=""

RDEPEND="dev-lang/python
	dev-python/pyyaml
	dev-python/urlgrabber
	dev-python/simplejson
	app-emulation/virtinst
	app-arch/rpm"

DEPEND="${RDEPEND}
	sys-devel/automake"

src_compile() {
	emake build || die "make build failed"
}

src_install() {
	emake DESTDIR="${D}" debinstall || die "make debinstall failed"
}
