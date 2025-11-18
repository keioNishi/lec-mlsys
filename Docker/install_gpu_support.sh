#!/bin/bash

echo "Installing NVIDIA Container Toolkit for Docker GPU support..."
echo ""

# Remove old conflicting repository files
echo "[1/6] Removing old NVIDIA repository configurations..."
sudo rm -f /etc/apt/sources.list.d/nvidia-toolkit.list
sudo rm -f /etc/apt/sources.list.d/nvidia-container-runtime.list

# Add NVIDIA repository
echo "[2/6] Adding NVIDIA GPG key..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg --yes

echo "[3/6] Adding NVIDIA repository..."
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo "[4/6] Updating package list..."
sudo apt-get update

echo "[5/6] Installing nvidia-container-toolkit..."
sudo apt-get install -y nvidia-container-toolkit

echo "[6/6] Configuring Docker runtime and restarting Docker..."
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

echo ""
echo "Installation complete!"
echo "You can now run ./run.sh to start the Colab container with GPU support."
