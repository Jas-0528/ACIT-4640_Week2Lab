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