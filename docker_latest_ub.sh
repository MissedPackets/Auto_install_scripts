#!/bin/bash

# install pkg to allow apt to use repos over https
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release



# docker gpg keys

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg


# setup repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#update step
sudo apt-get update

# if there is an error, run this cmd:
# sudo chmod a+r /etc/apt/keyrings/docker.gpg
# sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


echo -e "Docker is installed.\nTo run a test, use: sudo docker run hello-world"
