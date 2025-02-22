#!/bin/bash

set -ouex pipefail

# Configure packages.

remove_pkgs=(
	firefox
	firefox-langpacks
	google-noto-sans-balinese-fonts
	google-noto-sans-cjk-fonts
	google-noto-sans-javanese-fonts
	google-noto-sans-sundanese-fonts
	gnome-tour
	intel-vaapi-driver
	nvtop
	tmux
)
dnf remove -y ${remove_pkgs[@]}

install_pkgs=(
	neovim
)
dnf install -y ${install_pkgs[@]}

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
