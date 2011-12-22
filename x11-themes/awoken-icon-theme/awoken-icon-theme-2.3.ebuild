# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_PN="AwOken"
MY_PV="AwOken-2.3"
MY_SETS="AwOken AwOkenDark AwOkenWhite"
MY_PKG="awoken_by_alecive-d2pdw32.zip"

DESCRIPTION="AwOken Icon Theme"
HOMEPAGE="http://alecive.deviantart.com/art/AwOken-163570862"
SRC_URI="http://www.deviantart.com/download/163570862/${MY_PKG}"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}
	gnome-extra/zenity
	x11-misc/xdg-utils
	media-gfx/imagemagick"

RESTRICT="binchecks strip"

S="${WORKDIR}/${MY_PV}"

src_unpack() {
	unpack "$MY_PKG"
	cd "$S" || die
	for MY_SET in $MY_SETS; do
		tar -xzf "${MY_SET}.tar.gz" || die
	done
}

src_prepare() {
	cd "$S" || die
	for MY_SET in $MY_SETS; do
		chown -R root:root "${MY_SET}" || die
	done
	epatch "${FILESDIR}/${P}-scripts.patch"
}

awoken_symlink_dest() {
	F=$(file -b "$1")
	echo $F | egrep -q '^broken'
	if [ $? -eq 0 ]; then
		echo $F | awk '{print $5}' | sed -e "s/^\`//" -e "s/'$//"
	else
		echo $F | awk '{print $4}' | sed -e "s/^\`//" -e "s/'$//"
	fi
}

awoken_install_iconset() {
	MY_SET="$1"
	MY_DEST="/usr/share/icons/${MY_SET}"
	MY_SFX=$(echo "$MY_SET" | sed -e "s/^${MY_PN}//" -e 's/\(.*\)/\L\1/' -e 's/^$/clear/')

	cd "$S" || die

	dobin "${MY_SET}/awoken-icon-theme-customization-${MY_SFX}"
	dodir "$MY_DEST"
	insinto "$MY_DEST"
	doins "${MY_SET}/index.theme"

	cd "${S}/${MY_SET}" || die
	find {clear,extra} -type d | sed 's|\./||' | while read DIR; do
		dodir "${MY_DEST}/${DIR}"
	done

	find {clear,extra} -type f | sed 's|\./||' | while read FILE; do
		MY_DIR="$(dirname "$FILE")"
		insinto "${MY_DEST}/${MY_DIR}"
		doins "$FILE"
	done

	find {clear,extra} -type l | sed 's|\./||' | while read LINK; do
		MY_FILE="$(awoken_symlink_dest "$LINK")"
		dosym "$MY_FILE" "${MY_DEST}/${LINK}"
	done

	# Add missing symlinks for firefox-bin and thunderbird-bin.
	dosym firefox.png "${MY_DEST}/clear/24x24/apps/firefox-bin-icon.png"
	dosym firefox.png "${MY_DEST}/clear/128x128/apps/firefox-bin-icon.png"
	dosym thunderbird.png "${MY_DEST}/clear/24x24/apps/thunderbird-bin-icon.png"
	dosym thunderbird.png "${MY_DEST}/clear/128x128/apps/thunderbird-bin-icon.png"
}

src_install() {
	dodir "/usr/share/icons"
	dobin "${MY_PN}/awoken-icon-theme-customization"
	dodoc "${MY_PN}/Installation_and_Instructions.pdf"

	for MY_SET in $MY_SETS; do
		cd "$S" || die
		MY_SFX=$(echo "$MY_SET" | sed -e "s/^${MY_PN}//" -e 's/\(.*\)/\L\1/' -e 's/^$/clear/')
		dobin "${MY_SET}/awoken-icon-theme-customization-${MY_SFX}"
		awoken_install_iconset "$MY_SET"
	done
}

