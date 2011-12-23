# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_D="/usr/share/emerald/themes"

DESCRIPTION="Divergence Inspired Emerald themes"
HOMEPAGE=""
SRC_URI="http://gnome-look.org/CONTENT/content-files/136379-Divergence%20Inspired%20v0.4.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-wm/emerald"

RESTRICT="binchecks strip"

S="${WORKDIR}"

emerald_theme_name() {
	basename "$1" | sed "s/\.emerald$//g"
}

emerald_theme_extract() {
	NAME=$(emerald_theme_name "$1")
	test -e "${S}/${NAME}" && (rm -rf "${S}/${NAME}" || die)
	mkdir "${S}/${NAME}" || die
	tar -xzf "$1" -C "${S}/${NAME}" || die
	chmod -R u=rwX,g=rX,o=rX "${S}/${NAME}" || die
}

emerald_theme_install() {
	DEST="${MY_D}/${1}"
	cp -rf "${S}/${1}" "${D}/${DEST}" || die
}

src_unpack() {
	unpack "${A}"
	ls "${S}" | egrep '\.emerald$' | while read FILE; do
		emerald_theme_extract "$FILE"
	done
}

src_prepare() {
	cp -rf "${S}/Shiki Empire" "${S}/Shiki Empire Short" || die
	cd "${S}/Shiki Empire Short" || die
	cp "${FILESDIR}/shiki-empire-short-${PV}-pixmaps.active_bottom.png" \
		"pixmaps.active_bottom.png"
	epatch "${FILESDIR}/shiki-empire-short-${PV}-theme.patch"

	cp -rf "${S}/Ambient Empire" "${S}/Ambient Empire Short" || die
	cd "${S}/Ambient Empire Short" || die
	cp "${FILESDIR}/ambient-empire-short-${PV}-pixmaps.active_bottom.png" \
		"pixmaps.active_bottom.png"
	epatch "${FILESDIR}/ambient-empire-short-${PV}-theme.patch"

	cp -rf "${S}/Ambient Empire (Subdued)" "${S}/Ambient Empire Short (Subdued)" || die
	cd "${S}/Ambient Empire Short (Subdued)" || die
	cp "${FILESDIR}/ambient-empire-short-subdued-${PV}-pixmaps.active_bottom.png" \
		"pixmaps.active_bottom.png"
	epatch "${FILESDIR}/ambient-empire-short-subdued-${PV}-theme.patch"
}

src_install() {
	dodir "/usr/share/emerald"
	dodir "/usr/share/emerald/themes"

	find "${S}" -mindepth 1 -maxdepth 1 -type d | while read DIR; do
		NAME="$(basename "$DIR")"
		emerald_theme_install "$NAME"
	done
}

