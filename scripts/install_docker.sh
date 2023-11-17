# Remove old installations
apt-get remove docker docker-engine docker.io containerd runc -y
# Installation of requirements
apt-get update
apt-get install -y \
   ca-certificates \
   curl \
   gnupg \
   lsb-release
# Add the keyrings of docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Add the package repository
echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update the package repository
apt-get update

# Install Docker
apt-get install -y -ce docker-ce-cli containerd.io docker-compose-plugin

# Check for installation
# docker run hello-world