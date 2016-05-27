# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit font

DESCRIPTION="Programming font designed with functionality in mind and with some handwriting-like fuzziness"
HOMEPAGE="http://openfontlibrary.org/en/font/fantasque-sans-mono"
SRC_URI="http://openfontlibrary.org/assets/downloads/${PN}/b0cbb25e73a9f8354e96d89524f613e7/${PN}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_S="${S}/OTF"
FONT_SUFFIX="otf"
DOCS="README.md"
