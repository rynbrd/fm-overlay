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
IUSE="laptop pulseaudio"

DEPEND="
	app-admin/sysstat
	dev-python/pystache
	gnome-extra/nm-applet
	media-fonts/terminus-font
	media-gfx/feh
	media-gfx/scrot
	media-sound/alsa-utils
	net-misc/x11-ssh-askpass
	sys-apps/fm-system
	sys-apps/the_silver_searcher
	sys-power/acpi
	virtual/notification-daemon
	x11-apps/xdpyinfo
	x11-apps/xinput
	x11-apps/xmodmap
	x11-apps/xrandr
	x11-base/xorg-server
	x11-misc/dmenu
	x11-misc/i3lock
	x11-misc/i3status
	x11-misc/notification-daemon
	x11-misc/redshift
	x11-misc/slim
	x11-terms/rxvt-unicode
	x11-wm/i3
	laptop? (
		x11-drivers/xf86-input-mtrack
		x11-misc/dispad
	)
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
