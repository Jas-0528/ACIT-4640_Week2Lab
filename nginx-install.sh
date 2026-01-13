#!/bin/bash

# source the env file
source "$(pwd)/.env"

# ssh into the host
ssh -T -i "${KEY}" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "${USERNAME}@${HOST}" <<'EOF'

# update the system and install nginx
sudo apt-get update
sudo apt-get install -y nginx

# enable and start nginx
sudo systemctl enable nginx --now
EOF