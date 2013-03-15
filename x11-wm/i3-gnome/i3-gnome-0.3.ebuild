# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Some Gnome tools to make i3 a little friendlier."
HOMEPAGE="https://github.com/fm-overlay"
SRC_URI=""

LICENSE="BSD-modified"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="bluetooth"

DEPEND="
	bluetooth? ( net-wireless/blueman )
	>=gnome-base/gnome-keyring-3.6.0
	>=gnome-base/gnome-settings-daemon-3.6.0
	gnome-extra/nm-applet
	=x11-wm/i3-4.5
	=x11-misc/i3lock-2.4.1
	=x11-misc/i3status-2.6
	x11-misc/notification-daemon
"
RDEPEND="${DEPEND}"

