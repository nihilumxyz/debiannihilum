#!/bin/bash
set -e

echo "Updating package lists..."
sudo apt update

echo "Installing Liquorix kernel"
curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash
#!/bin/bash

echo "Enabling zswap..."
echo 1 | sudo tee /sys/module/zswap/parameters/enabled > /dev/null || echo "Zswap module not loaded, skipping..."
echo 20 | sudo tee /sys/module/zswap/parameters/max_pool_percent > /dev/null || echo "Zswap module not loaded, skipping..."

echo "Setting I/O scheduler to mq-deadline..."
for disk in /sys/block/nvme*n*/queue/scheduler /sys/block/sd*/queue/scheduler; do
  echo mq-deadline | sudo tee $disk > /dev/null || true
done

echo "Installatie and tweaks done."
sudo reboot
