# shellcheck shell=bash
termux_setup_cabal() {
	if [[ "${TERMUX_ON_DEVICE_BUILD}" == "false" ]]; then
		local TERMUX_CABAL_VERSION=3.10.2.1
		local TERMUX_CABAL_TAR="${TERMUX_COMMON_CACHEDIR}/cabal-${TERMUX_CABAL_VERSION}.tar.xz"

		local TERMUX_CABAL_RUNTIME_FOLDER

		if [[ "${TERMUX_PACKAGES_OFFLINE-false}" == "true" ]]; then
			TERMUX_CABAL_RUNTIME_FOLDER="${TERMUX_SCRIPTDIR}/build-tools/cabal-${TERMUX_CABAL_VERSION}-runtime"
		else
			TERMUX_CABAL_RUNTIME_FOLDER="${TERMUX_COMMON_CACHEDIR}/cabal-${TERMUX_CABAL_VERSION}-runtime"
		fi

		export PATH="${TERMUX_CABAL_RUNTIME_FOLDER}:${PATH}"

		[[ -d "${TERMUX_CABAL_RUNTIME_FOLDER}" ]] && return

		termux_download "https://github.com/rhjdvsgsgks/ghc-cross-tools/releases/download/cabal-install-v${TERMUX_CABAL_VERSION}/cabal-install-${TERMUX_CABAL_VERSION}.tar.xz" \
			"${TERMUX_CABAL_TAR}" \
			4f5eaa7fd72d87efaa3444003f5847cb4cd5c4ea5e0883b551487d43fb5752b5

		mkdir -p "${TERMUX_CABAL_RUNTIME_FOLDER}"
		tar xf "${TERMUX_CABAL_TAR}" -C "${TERMUX_CABAL_RUNTIME_FOLDER}"
		rm "${TERMUX_CABAL_TAR}"

		cabal update

	else
		if [[ "${TERMUX_APP_PACKAGE_MANAGER}" == "apt" ]] && "$(dpkg-query -W -f '${db:Status-Status}\n' cabal-install 2>/dev/null)" != "installed" ||
			[[ "${TERMUX_APP_PACKAGE_MANAGER}" == "pacman" ]] && ! "$(pacman -Q cabal-install 2>/dev/null)"; then
			echo "Package 'cabal-install' is not installed."
			exit 1
		fi
	fi
}
