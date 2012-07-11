# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/git-sources/git-sources-3.5_rc5.ebuild,v 1.1 2012/07/01 00:50:29 mpagano Exp $

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
	${FILESDIR}/${PV}-keyboard.patch
	${FILESDIR}/${PV}-trackpad.patch"

# only use this if it's not an _rc/_pre release
[ "${PV/_pre}" == "${PV}" ] && [ "${PV/_rc}" == "${PV}" ] && OKV="${PV}"
inherit kernel-2
detect_version

DESCRIPTION="The very latest -git version of the Linux kernel with Retina patches applied"
HOMEPAGE="http://www.kernel.org"
SRC_URI="${KERNEL_URI}"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE=""

K_EXTRAEINFO="This kernel is not supported by Gentoo due to its unstable and
experimental nature. If you have any issues, try a matching vanilla-sources
ebuild -- if the problem is not there, please contact the upstream kernel
developers at http://bugzilla.kernel.org and on the linux-kernel mailing list to
report the problem so it can be fixed in time for the next kernel release."

src_install() {
	mv "${WORKDIR}/linux-${KV_FULL}" "${WORKDIR}/linux-${KV_FULL%-*}-retina-${KV_FULL##*-}"
	kernel-2_src_install
}

pkg_postinst() {
	postinst_sources
}
