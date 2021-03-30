set -e
export DEBIAN_FRONTEND=noninteractive

sudo apt update
sudo apt upgrade -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update

sudo apt install -y nodejs npm yarn
sudo apt install -y git jq
sudo apt install -y docker.io docker-compose

sudo systemctl enable docker
sudo gpasswd -a $USER docker
newgrp docker
