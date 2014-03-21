# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="i3 based desktop environment."
HOMEPAGE="https://github.com/BlueDragonX/fm-overlay"
SRC_URI=""

LICENSE="BSD-modified"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="pulseaudio"

DEPEND="
	>=x11-misc/i3lock-2.4.1
	>=x11-misc/i3status-2.6
	>=x11-wm/i3-4.5
	gnome-extra/nm-applet
	media-fonts/terminus-font
	media-sound/alsa-utils
	sys-apps/fm-system
	sys-apps/the_silver_searcher
	virtual/notification-daemon
	x11-apps/xdpyinfo
	x11-apps/xmodmap
	x11-apps/xrandr
	x11-base/xorg-server
	x11-misc/dmenu
	x11-misc/slim
	x11-terms/rxvt-unicode
	pulseaudio? (
		>=media-sound/pavucontrol-2.0
		>=media-sound/pulseaudio-5.0
	)
"
RDEPEND="${DEPEND}"

pkg_config() {
	local xdmconf="${ROOT}/etc/conf.d/xdm"
	if egrep '^DISPLAYMANAGER=' "$xdmconf"; then
		sed -i -e 's/^DISPLAYMANAGER=.*/DISPLAYMANAGER="slim"/g' "$xdmconf"
	else
		echo 'DISPLAYMANAGER="slim"' >> "$xdmconf"
	fi
	rc-config add xdm default
	elog "XDM is configured to start Slim on boot."
}
