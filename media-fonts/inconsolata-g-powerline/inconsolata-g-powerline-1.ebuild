# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-fonts/inconsolata/inconsolata-20090222.ebuild,v 1.4 2011/11/04 11:24:10 naota Exp $

inherit git-2
inherit font

DESCRIPTION="Modified Inconsolata font."
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/Lokaltog/powerline-fonts.git"
EGIT_REPO_COMMIT="8559a95aca63607a83de7ade6aca3923c0997100"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 x86 ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""

FONT_SUFFIX="otf"
FONT_S="${WORKDIR}/${P}/Inconsolata-g"

# Only installs fonts.
RESTRICT="strip binchecks"
