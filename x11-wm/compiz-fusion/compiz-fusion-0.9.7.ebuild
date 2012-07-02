# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_PV="0.9.5"

DESCRIPTION="Compiz Fusion Meta-Package"
HOMEPAGE="http://www.compiz.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emerald gnome extras"

RDEPEND="
	gnome? (
		>=x11-wm/compiz-${PV}[gnome,gtk]
		>=x11-libs/compizconfig-backend-gconf-${MY_PV}.0
	)
	!gnome? (
		>=x11-wm/compiz-${PV}
	)
	>=x11-plugins/compiz-plugins-main-${PV}.0
	extras? (
		>=x11-plugins/compiz-plugins-extra-${PV}.0
	)
	>=x11-apps/ccsm-${MY_PV}.0
	>=x11-wm/emerald-${MY_PV}"

