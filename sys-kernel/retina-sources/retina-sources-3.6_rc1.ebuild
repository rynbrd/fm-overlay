# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
UNIPATCH_STRICTORDER="yes"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_NOUSEPR="yes"
K_SECURITY_UNSUPPORTED="yes"
K_DEBLOB_AVAILABLE=0
ETYPE="sources"
CKV="${PVR/-r/-git}"

UNIPATCH_LIST="
	${FILESDIR}/${PV}-version.patch
	${FILESDIR}/${PV}-bluetooth.patch
	${FILESDIR}/${PV}-nouveau_enable_gpio.patch"

# only use this if it's not an _rc/_pre release
[ "${PV/_pre}" == "${PV}" ] && [ "${PV/_rc}" == "${PV}" ] && OKV="${PV}"
inherit kernel-2
detect_version

echo $KV_FULL
MY_S="${WORKDIR}/linux-${KV_FULL%-*}-retina-${KV_FULL#*-}"

DESCRIPTION="The -git kernel with patches applied to support the MacBook Pro 10,1 Retina"
HOMEPAGE="http://www.kernel.org"
SRC_URI="${KERNEL_URI}"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE=""

K_EXTRAEINFO="This kernel is not supported by Gentoo. It should not be used on
any device other than the MacBook Pro 10,1 Retina due to the nature of some of
the patches."

src_unpack() {
	kernel-2_src_unpack
	mv "$S" "$MY_S"
	S="$MY_S"
}

pkg_postinst() {
	postinst_sources
}

