#!/bin/bash
set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# this installs a package from fedora repos
dnf5 install -y just
dnf5 install -y development-tools

# Remove unecessary packages
# Firefox
dnf5 remove -y firefox firefox-langpacks

# Vim
dnf5 remove -y vim-minimal

# Fedora configs
dnf5 remove -y fedora-workstation-backgrounds fedora-bookmarks fedora-chromium-config

# CLI Tools replacable by homebrew
dnf5 remove -y nano nano-default-editor default-editor
dnf5 remove -y bc
dnf5 remove -y tree
dnf5 remove -y rsync
dnf5 remove -y zip
dnf5 remove -y lsof
dnf5 remove -y mtr
dnf5 remove -y whois
dnf5 remove -y wget2-wget
dnf5 remove -y git-core git-core-doc

dnf5 clean all
systemctl enable podman.socket
