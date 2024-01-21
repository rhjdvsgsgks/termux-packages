TERMUX_PKG_HOMEPAGE="https://github.com/matterhorn-chat/matterhorn"
TERMUX_PKG_DESCRIPTION="A terminal-based chat client for MatterMost"
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_MAINTAINER="r"
TERMUX_PKG_VERSION=50200.19.0
TERMUX_PKG_SRCURL="https://hackage.haskell.org/package/matterhorn-${TERMUX_PKG_VERSION}/matterhorn-${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=d2c0e80fe00ba7fc28019392cbf7cac40812faa5c1564236af5a458c179241e7
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="libgmp, zlib"
TERMUX_PKG_BUILD_DEPENDS="ghc-libs"
TERMUX_CABAL_VERSION=3.10.2.1
