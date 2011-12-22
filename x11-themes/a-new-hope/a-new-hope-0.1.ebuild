# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_PKG="divergence_iv_____a_new_hope___by_jurialmunkey-d316eqx.zip"

DESCRIPTION="Divergence IV - \"A New Hope\" GTK Theme"
HOMEPAGE="http://jurialmunkey.deviantart.com/#/d316eqx"
SRC_URI="http://www.deviantart.com/download/183377193/${MY_PKG}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emerald"

DEPEND=""
RDEPEND="${DEPEND}
	x11-themes/gtk-engines-murrine
	dev-lang/python
	dev-python/pygtk
	emerald? ( x11-wm/emerald )"

RESTRICT="binchecks strip"

S="${WORKDIR}"

emerald_theme_install() {
	NAME=$(echo "$1" | sed "s/\.emerald$//g")
	MY_D="/usr/share/emerald/themes/${NAME}"
	dodir "$MY_D"
	tar -xzf "$1" -C "${D}/${MY_D}" || die
}

src_unpack() {
	unpack "$MY_PKG"
	cd "$S" || die
	tar -xzf "A-New-Hope.tar.gz"
}

src_prepare() {
	cd "${S}/A-New-Hope" || die
	rm -f "Configure A New Hope" || die
	mv "customise.py" "customize.py"
	epatch "${FILESDIR}/${PV}-customize.patch"
}

src_install() {
	dodir "/usr/share/themes"
	cp -rf "${S}/A-New-Hope" "${D}/usr/share/themes/"
	dosym "/usr/share/themes/A-New-Hope/customize.py" "/usr/bin/a-new-hope-customize"

	if use emerald; then
		dodir "/usr/share/emerald"
		dodir "/usr/share/emerald/themes"
		cd "${S}/EMERALD"
		ls | egrep '\.emerald$' | while read FILE; do
			emerald_theme_install "$FILE"
		done
	fi
}

