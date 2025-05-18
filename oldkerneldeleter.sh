#!/bin/bash
set -e

echo "searches for kernels that do not contain  'liquorix'..."

# Pak alle geïnstalleerde kernels behalve de Liquorix
oude_kernels=$(dpkg --list | grep linux-image | awk '{print $2}' | grep -v liquorix)

if [ -z "$oude_kernels" ]; then
  echo "NO old kernels found."
  exit 0
fi

echo "Old kernels are getting deleted:"
echo "$oude_kernels"

echo "Deleting..."
sudo apt remove -y $oude_kernels

echo "Cleaning up old kernels..."
sudo apt autoremove -y

echo "Update GRUB configuration..."
sudo update-grub

echo "All done."
