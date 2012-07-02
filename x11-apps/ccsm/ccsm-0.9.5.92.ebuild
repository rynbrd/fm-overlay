# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit distutils

MY_PV="${PV%.*}"
UBUNTU_PN="compizconfig-settings-manager"
UBUNTU_PV="${PV}-0ubuntu3"
UBUNTU_P="${UBUNTU_PN}_${PV}"

DESCRIPTION="Compiz config settings manager."
HOMEPAGE="https://launchpad.net/compizconfig-settings-manager"
SRC_URI="https://launchpad.net/ubuntu/precise/+source/${UBUNTU_PN}/${UBUNTU_PV}/+files/${UBUNTU_P}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/compizconfig-python-${MY_PV}.0
	>=dev-python/pygtk-2.10"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install --prefix="/usr"
}

