#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

remove_pkgs=(
	alsa-firmware
	firefox
	firefox-langpacks
	flatpak-spawn
	google-noto-sans-balinese-fonts
	google-noto-sans-cjk-fonts
	google-noto-sans-javanese-fonts
	google-noto-sans-sundanese-fonts
	grub2-tools-extra
	intel-vaapi-driver
	just
	libcamera
	libcamera-gstreamer
	libcamera-ipa
	libcamera-tools
	libratbag-ratbagd
	libva-utils
	lshw
	net-tools
	nvme-cli
	nvtop
	openrgb-udev-rules
	oversteer-udev
	pam-u2f
	pam_yubico
	pamu2fcfg
	pipewire-libs-extra
	pipewire-plugin-libcamera
	powerstat
	smartmontools
	squashfs-tools
	symlinks
	tcpdump
	tmux
	traceroute
	vim
	wireguard-tools
)
dnf remove -y ${remove_pkgs[@]}

install_pkgs=(
	android-udev-rules
	distrobox
	duplicity
	fzf
	htop
	neovim
	solaar-udev
	wl-clipboard
)
dnf install -y ${install_pkgs[@]}

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
