# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-fonts/inconsolata/inconsolata-20090222.ebuild,v 1.4 2011/11/04 11:24:10 naota Exp $

inherit font

DESCRIPTION="Modified Inconsolata font."
HOMEPAGE=""
SRC_URI="http://www.fantascienza.net/leonardo/ar/inconsolatag/inconsolata-g_font.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 x86 ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""

FONT_CONF=( "${FILESDIR}/77-yes-inconsolata-g.conf" )
FONT_SUFFIX="otf"
FONT_S="${WORKDIR}"

# Only installs fonts.
RESTRICT="strip binchecks"
