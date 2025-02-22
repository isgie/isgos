#!/bin/bash

set -ouex pipefail

# Configure packages.

noto_fonts=(
	google-noto-sans-balinese-fonts
	google-noto-sans-cjk-fonts
	google-noto-sans-javanese-fonts
	google-noto-sans-sundanese-fonts
)

vim=( vim vim-{common,data,enhanced,filesystem,minimal} )

remove_pkgs=(
	firefox
	firefox-langpacks
	gnome-tour
	intel-vaapi-driver
	nvtop
	tmux
	${noto_fonts[@]}
	${vim[@]}
)
dnf remove -y ${remove_pkgs[@]}

install_pkgs=(
	ddcutil
	neovim
)
dnf install -y ${install_pkgs[@]}

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
