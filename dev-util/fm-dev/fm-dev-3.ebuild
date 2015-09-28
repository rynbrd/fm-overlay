# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Fated Mariner dev tool dependencies."
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="
	app-emulation/docker
	dev-db/mongodb
	dev-db/postgresql
	dev-db/redis
	dev-db/sqlite:3
	dev-lang/go
	dev-lang/python:2.7
	dev-lang/python:3.4
	dev-libs/libpcre
	dev-libs/libxml2
	dev-python/boto
	dev-python/docker-py
	dev-python/dockerpty
	dev-python/flake8
	dev-python/ipython
	dev-python/pcapy
	dev-python/pep8
	dev-python/pip
	dev-python/pyflakes
	dev-python/pyyaml
	dev-python/pyzmq
	dev-python/requests
	dev-python/virtualenv
	dev-tcltk/expect
	dev-vcs/git
	dev-vcs/mercurial
	dev-vcs/tig
	net-analyzer/netcat6
	net-dialup/freeradius[python]
	net-dns/bind-tools
	net-libs/nodejs
	net-misc/dhcp[server]
	net-misc/s3cmd
	"
RDEPEND="${DEPEND}"

