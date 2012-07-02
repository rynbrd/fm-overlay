# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

UBUNTU_PV="${PV}-0ubuntu4"
UBUNTU_PN="${PN}_${PV}"

DESCRIPTION="Compiz config Python bindings."
HOMEPAGE="https://launchpad.net/compizconfig-python"
SRC_URI="https://launchpad.net/ubuntu/precise/+source/${PN}/${UBUNTU_PV}/+files/${UBUNTU_PN}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=x11-wm/compiz-${PV}
	~x11-libs/libcompizconfig-${PV}
	>=dev-libs/glib-2.6
	dev-python/cython"
RDEPEND="${DEPEND}"

