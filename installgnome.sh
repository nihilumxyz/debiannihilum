#!/bin/bash
set -e

echo "Starting minimal GNOME setup with essentials only..."

sudo apt update

sudo apt install -y \
  gnome-shell \
  gnome-control-center \
  nautilus \
  kitty \
  firefox-esr \
  network-manager-gnome \
  gnome-bluetooth-3-common \
  gnome-backgrounds \
  gnome-keyring \
  policykit-1-gnome \
  gnome-settings-daemon \
  gnome-session \
  xdg-user-dirs-gtk \
  adwaita-icon-theme \
  gnome-themes-extra

echo "Essential packages installed."

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 100
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

echo "Kitty set as default terminal."

echo "Minimal GNOME setup complete! Reboot for best results."
