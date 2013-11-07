# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="The Scala IDE bundle to run eclipse with tools for scala"
HOMEPAGE="http://scala-ide.org"
SRC_URI="http://download.scala-ide.org/sdk/e37/scala210/stable/update-site.zip"

LICENSE="Scala"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/jre"
RDEPEND="${DEPEND}
		dev-java/maven-bin:3.0"

src_unpack() {

	default_src_unpack
	mkdir "${S}"
	mv "${WORKDIR}"/eclipse/* "${S}"
}

src_install() {

	dodir /usr/{bin,share/"${P}"}
	cp -r "${S}"/* "${D}"/usr/share/"${P}"
	dosym /usr/share/"${P}"/eclipse /usr/bin/eclipse
}
