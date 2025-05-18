#!/bin/bash
set -e

echo "Updating package lists and installing essentials..."
sudo apt update
sudo apt install -y curl flatpak

echo "Adding Flathub repository if not present..."
if ! flatpak remote-list | grep -q flathub; then
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

echo "Installing Kate as Flatpak..."
flatpak install -y flathub org.kde.kate

echo "Installing Firefox (native)..."
sudo apt install -y firefox-esr

echo "Installing Signal (deb package)..."
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo tee /usr/share/keyrings/signal-desktop-keyring.asc > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.asc] https://updates.signal.org/desktop/apt xenial main" | sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update
sudo apt install -y signal-desktop

echo "Downloading Bitwarden AppImage..."
mkdir -p ~/Applications
flatpak install flathub com.bitwarden.desktop
echo "Downloading Tutanota AppImage..."
flatpak install flathub com.tutanota.Tutanota
echo "Downloading FreeTube Flatpak and installing..."
flatpak install -y flathub io.freetubeapp.FreeTube

echo "Making AppImages executable..."
chmod +x ~/Applications/*.AppImage

echo "Installation complete! You can run Bitwarden and Tutanota from ~/Applications."

