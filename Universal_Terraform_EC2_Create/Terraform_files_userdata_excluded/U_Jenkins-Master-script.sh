#!/bin/bash

# Update the package index
sudo apt update -y
#sudo apt upgrade -y

# Append configurations to /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
# Restart SSH service and reload daemon
systemctl restart sshd
systemctl daemon-reload

# Install required packages
sudo apt install wget openjdk-17-jdk git -y

# Add Jenkins repository and key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
	  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
	  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package index after adding Jenkins repository
sudo apt update -y

# Install Jenkins
sudo apt install jenkins -y

# Enable and start Jenkins service
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
# sudo systemctl status jenkins
