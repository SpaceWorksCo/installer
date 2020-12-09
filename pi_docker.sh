#!/bin/bash
cat << "EOF"
        _..._
      .'     '.      _         / _____|_____ (_______|_______|_______)
     /    .-""-\   _/ \       ( (____  _____) )______ _       _____
   .-|   /:.   |  |   |        \____ \|  ____/  ___  | |     |  ___)
   |  \  |:.   /.-'-./         _____) ) |    | |   | | |_____| |_____
   | .-'-;:__.'    =/         (______/|_|    |_|   |_|\______)_______)
   .'=  *=|SPACE_.='                                  Docker Installer Program
  /   _.  |    ;
 ;-.-'|    \   |
/   | \    _\  _\
\__/'._;.  ==' ==\
         \    \   |
         /    /   /
         /-._/-._/
         \   `\  \
          `-._/._/
EOF

echo ">> Increasing SWAP size"
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Installing Docker if not already available
echo ">> Checking Docker"
if ! command -v docker version &>/dev/null; then
  echo ">> Docker could not be found, installing it."
  # Installing docker
  curl -sSL https://get.docker.com | sh
  # Adding daemon permissions to 'pi' user
  sudo usermod -aG docker pi
  exit
else
  echo ">> Docker is ready"
fi

echo ">> Configuring the SPACE docker image"
# Building and tagging the container
sudo docker pull spaceworksco/spacecoin

echo ">> Launching SPACE!"
# Running the container
sudo docker run -it -v /home/pi/.komodo/SPACE:/root/.komodo/SPACE spaceworksco/spacecoin

echo ">> HAPPY JOURNEY IN SPACE! <<"
