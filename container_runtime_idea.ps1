## This is not tested so far and only and idea how it can work !!!

# Install WSL and Ubuntu if not already installed
wsl --install -d Ubuntu

# Launch Ubuntu to complete setup
wsl -d Ubuntu

# Execute installation commands in Ubuntu
wsl -d Ubuntu -- bash -c "
sudo apt update &&
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo 'deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable' | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
sudo apt update &&
sudo apt install -y docker-ce docker-ce-cli containerd.io &&
sudo usermod -aG docker $USER &&
sudo service docker start
"

# Restart WSL to apply group changes
wsl --shutdown

# Print Docker version to verify installation
wsl -d Ubuntu -- docker --version

# one still needs to make sure it works with GPU support and can be used from windows