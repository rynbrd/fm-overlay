# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Core system utilities."
HOMEPAGE="https://github.com/BlueDragonX/fm-overlay"
SRC_URI=""

LICENSE="BSD-modified"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="avahi bluetooth laptop networkmanager"

DEPEND="
	app-admin/sudo
	app-editors/vim
	app-misc/tmux
	app-portage/eix
	app-shells/bash-completion
	app-shells/gentoo-bashcomp
	dev-vcs/git
	net-firewall/iptables
	net-misc/ntp
	net-misc/openssh
	sys-apps/mlocate
	sys-apps/pciutils
	sys-apps/usbutils
	sys-kernel/genkernel-next
	sys-power/pm-utils
	avahi? ( net-dns/avahi )
	bluetooth? ( >=net-wireless/bluez-5.0 )
	laptop? (
		app-laptop/laptop-mode-tools
		sys-power/acpid
		sys-power/powertop
	)
	networkmanager? ( net-misc/networkmanager )
"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "$S"
}

src_install() {
	insopts -m0440
	insinto "/etc/sudoers.d"
	doins "${FILESDIR}/sudoers.wheel"
}

pkg_config() {
	eselect editor set /usr/bin/vi
	systemctl enable ntpd.service
	systemctl enable sshd.service

	if use avahi; then
		systemctl enable avahi-daemon.service
	fi

	if use bluetooth; then
		systemctl enable bluetooth.service
	fi

	if use laptop; then
		systemctl enable acpid.service
		systemctl enable laptop_mode.service
	fi

	if use networkmanager; then
		systemctl enable NetworkManager.service
	fi
}
