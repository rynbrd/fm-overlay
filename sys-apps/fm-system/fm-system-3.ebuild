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
IUSE="avahi bluetooth distcc laptop networkmanager nfs wifi zfs"

DEPEND="
	>=sys-devel/gcc-4.8.0
	app-admin/sudo
	app-editors/vim
	app-misc/tmux
	app-portage/eix
	app-portage/gentoolkit
	app-portage/layman
	app-shells/bash-completion
	app-shells/gentoo-bashcomp
	dev-vcs/git
	net-firewall/iptables
	net-misc/bridge-utils
	net-misc/dhcpcd
	net-misc/ntp
	net-misc/openssh
	sys-apps/mlocate
	sys-apps/pciutils
	sys-apps/systemd
	sys-apps/usbutils
	sys-boot/grub
	sys-kernel/genkernel-next
	sys-libs/glibc[nscd]
	sys-power/pm-utils
	avahi? ( net-dns/avahi )
	bluetooth? ( >=net-wireless/bluez-5.0 )
	distcc? ( sys-devel/distcc )
	laptop? (
		app-laptop/laptop-mode-tools
		sys-power/acpid
		sys-power/powertop
	)
	networkmanager? ( net-misc/networkmanager )
	nfs? ( net-fs/nfs-utils )
	wifi? ( net-wireless/wpa_supplicant )
	zfs? ( sys-fs/zfs )
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
	rc-config add cronie default
	rc-config add nscd default
	rc-config add ntpd default
	rc-config add sshd default
	rc-config add syslog-ng default

	if use avahi; then
		rc-config add avahi-daemon default
	fi

	if use bluetooth; then
		rc-config add bluetooth default
	fi

	if use distcc; then
		rc-config add distccd default
	fi

	if use laptop; then
		rc-config add acpid default
		rc-config add laptop_mode default
	fi

	if use networkmanager; then
		rc-config add NetworkManager default
	fi

	if use nfs; then
		rc-config add nfs default
	fi

	if use zfs; then
		rc-config add zfs default
	fi
}
