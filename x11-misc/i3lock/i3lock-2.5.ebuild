# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/i3lock/i3lock-2.5.ebuild,v 1.3 2013/09/02 16:19:04 nimiux Exp $

EAPI=5

inherit toolchain-funcs eutils

DESCRIPTION="Simple screen locker"
HOMEPAGE="http://i3wm.org/i3lock/"
SRC_URI="http://i3wm.org/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="text"

RDEPEND="virtual/pam
	dev-libs/libev
	>=x11-libs/libxkbcommon-0.3.1
	x11-libs/libxkbfile
	x11-libs/xcb-util
	x11-libs/libX11
	x11-libs/cairo[xcb]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
DOCS=( CHANGELOG README )

pkg_setup() {
	tc-export CC
}

src_prepare() {
	sed -i -e 's:login:system-auth:' ${PN}.pam || die

	# patch which remove text
	use text || epatch "${FILESDIR}/${P}-noverbose.patch"
}

src_install() {
	default
	doman ${PN}.1
}
