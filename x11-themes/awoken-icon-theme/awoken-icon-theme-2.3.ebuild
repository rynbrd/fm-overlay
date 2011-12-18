# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_PN="AwOken"
MY_PV="AwOken-2.3"
MY_DEST="/usr/share/icons/${MY_PN}"

DESCRIPTION="AwOken Icon Theme"
HOMEPAGE="http://alecive.deviantart.com/art/AwOken-163570862"
SRC_URI="http://www.deviantart.com/download/163570862/awoken_by_alecive-d2pdw32.zip"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}
	gnome-extra/zenity
	x11-misc/xdg-utils
	media-gfx/imagemagick"

RESTRICT="binchecks strip"

S="${WORKDIR}/${MY_PV}"

src_unpack() {
	unpack "awoken_by_alecive-d2pdw32.zip"
	cd "${S}" || die
	tar -xzf "${MY_PN}.tar.gz" || die
}

src_prepare() {
	cd "${S}" || die
	chown -R root:root "${MY_PN}" || die
	cd "${S}/${MY_PN}" || die
	epatch "${FILESDIR}/awoken-docfix.patch"
}

get_symlink_dest() {
	F=$(file -b $1)
	echo $F | egrep -q '^broken'
	if [ $? -eq 0 ]; then
		echo $F | awk '{print $5}' | sed -e "s/^\`//" -e "s/'$//"
	else
		echo $F | awk '{print $4}' | sed -e "s/^\`//" -e "s/'$//"
	fi
}

src_install() {
	dodir "/usr/share/icons"
	dobin "${MY_PN}/awoken-icon-theme-customization"
	dobin "${MY_PN}/awoken-icon-theme-customization-clear"
	dodoc "${MY_PN}/Installation_and_Instructions.pdf"

	dodir "${MY_DEST}"
	insinto "${MY_DEST}"
	doins "${MY_PN}/index.theme"

	cd "${S}/${MY_PN}"
	find {clear,extra} -type d | sed 's|\./||' | while read DIR; do
		dodir "${MY_DEST}/${DIR}"
	done

	cd "${S}/${MY_PN}"
	find {clear,extra} -type f | sed 's|\./||' | while read FILE; do
		MY_DIR=$(dirname $FILE)
		insinto "${MY_DEST}/${MY_DIR}"
		doins ${FILE}
	done

	cd "${S}/${MY_PN}"
	find {clear,extra} -type l | sed 's|\./||' | while read LINK; do
		MY_FILE=$(get_symlink_dest $LINK)
		dosym ${MY_FILE} "${MY_DEST}/${LINK}"
	done
}

