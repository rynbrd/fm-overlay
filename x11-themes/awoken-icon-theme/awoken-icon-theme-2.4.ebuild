# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_PN="AwOken"
MY_P="${MY_PN}-${PV}"
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

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack "$MY_PKG"
	cd "$S" || die
	for MY_SET in $MY_SETS; do
		tar -xf "${MY_SET}.tar.gz" || die
	done
}

src_prepare() {
	cd "$S" || die
	for MY_SET in $MY_SETS; do
		chown -R root:root "${MY_SET}" || die
	done
}

awoken_install_iconset() {
	MY_SET="$1"
	MY_S="${S}/${MY_SET}"
	MY_D="/usr/share/icons/${MY_SET}"
	MY_SFX=$(echo "$MY_SET" | sed -e "s/^${MY_PN}//" -e 's/\(.*\)/\L\1/' -e 's/^$/clear/')

	cd "$S" || die
	dodir "$MY_D"
	insinto "$MY_D"
	exeinto "$MY_D"
	doexe "${MY_SET}/awoken-icon-theme-customization-${MY_SFX}"
	doins "${MY_SET}/index.theme"
	dosym "${MY_D}/awoken-icon-theme-customization-${MY_SFX}" \
		"/usr/bin/awoken-icon-theme-customization-${MY_SFX}"
	if [ "$MY_SET" == "$MY_PN" ]; then
		doexe "${MY_D}/awoken-icon-theme-customization"
		doins "${MY_D}/Installation_and_Instructions.pdf"
		dosym "${MY_D}/awoken-icon-theme-customization" \
			"/usr/bin/awoken-icon-theme-customization"
	fi

	cd "$MY_S" || die
	cp -rf "${MY_S}"/{clear,extra} "${D}/${MY_D}" || die
	chmod -R u+rwX,g+rX-w,o+rX-w "${D}/${MY_D}"/{clear,extra} || die
	chmod +x $(find "${D}/${MY_D}"/extra -name '*sh')

	# Add missing symlinks for firefox-bin and thunderbird-bin.
	dosym "firefox.png" "${MY_D}/clear/24x24/apps/firefox-bin-icon.png"
	dosym "firefox.png" "${MY_D}/clear/128x128/apps/firefox-bin-icon.png"
	dosym "thunderbird.png" "${MY_D}/clear/24x24/apps/thunderbird-bin-icon.png"
	dosym "thunderbird.png" "${MY_D}/clear/128x128/apps/thunderbird-bin-icon.png"
}

src_install() {
	dodir "/usr/bin"
	dodir "/usr/share/icons"
	for MY_SET in $MY_SETS; do
		awoken_install_iconset "$MY_SET"
	done
}

