# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Utilities to make i3 a little friendlier."
HOMEPAGE="https://github.com/fm-overlay"
SRC_URI=""

LICENSE="BSD-modified"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="bluetooth"

DEPEND="
	>=x11-misc/i3lock-2.4.1
	>=x11-misc/i3status-2.6
	>=x11-wm/i3-4.5
	bluetooth? ( net-wireless/blueman )
	gnome-extra/nm-applet
	x11-misc/notification-daemon
"
RDEPEND="${DEPEND}"

