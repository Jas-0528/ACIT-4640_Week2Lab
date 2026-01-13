In Class Lab -  Augustin Nguyen, Jasmeen Sandhu, Maksym Buhai 

1. Create SSH key pair
    
    `ssh-keygen -t ed25519 -f ~/.ssh/wkone -C "wkone"`
    
2. Import generated keypair into EC2 Keypairs
3. Set up EC2 instance running Debian 
    - allow SSH and HTTP
4. Create Environmental variables file with username, IP address and SSH key path.
    
5. Source the env variables file: `source .env`
    - use echo to verify the variables can get called
6. Script #1: nginx-install:
    
    ```bash
                                                                          nginx-instal#!/bin/bash
    #!bin/bash
    
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
    ```
    
7. Script #2: document-write:
    
    ```bash
    #!/usr/bin/env bash
    
    source .env
    ssh -T -i ${KEY} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ${USERNAME}@${HOST} <<- OUTER
    
    sudo tee /var/www/html/index.nginx-debian.html > /dev/null <<INNER
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Hello World</title>
    </head>
    <body>
      <h1>Hello World!</h1>
      <p>Today's date is: $(date)</p>
    </body>
    </html>
    INNER
    
    OUTER
    ```
    
8.Change the premission of the scripts to be executable
    ```
    sudo chmod 700 ./nginx-install
    sudo chmod 700 ./document-write
    ```
9. Run the scripts
   ```
    sudo ./nginx-install
    sudo ./document-write
   ``` 
   
10. Verify that nginx is working
