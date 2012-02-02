#
# Copyright (C) 2008-2010 Stefan Knoblich <s.knoblich@axsentis.de>
#
# Distributed under the terms of the GNU General Public License 2
# see http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt for
# more information
#

EAPI="2"

inherit autotools python git

DESCRIPTION="Cobbler Install/Update Server"
HOMEPAGE="http://cobbler.github.com/"

EGIT_REPO_URI="git://git.freeswitch.org/freeswitch.git"
EGIT_COMMIT="eb89d3256f746b4d3ae0eba43e9d2672e682357b"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"

IUSE=""

RDEPEND="dev-lang/python
	dev-python/pyyaml"

DEPEND="${RDEPEND}
	sys-devel/automake"

src_prepare() {
	sed -e 's|chown -R apache /usr/share/cobbler/web||' -i Makefile
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
}
