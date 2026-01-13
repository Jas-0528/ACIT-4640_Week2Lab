# ACIT-4640_Week2Lab
Two small scripts to install nginx and write an HTML document that will be served by nginx.

Part 1.

Create a new SSH key pair in your local development environment. Add the public key to your AWS account.

- Key type: ed25519
- Key name: wkone  

Add the command used to generate your SSH key pair and a description of options used in the command to your readme.

Part 2.

Create a new EC2 instance running Debian that uses the ssh key you created for part 1.

You don't need to document this step

You will need to have access to your EC2 instance via SSH and HTTP

Part 3.

Write two scripts that will connect to your remote server via SSH using the key you created in part 1.

In addition to the two scripts create another file that will create environment variables for your 
- username
- IP address
- SSH key path 
This file doesn't need a shebang and can be sourced, with the `source` built-in to make your environment variables available in your environment. 

You should be running your scripts from your development environment, not the EC2 instance created in step 2.

Your scripts should reference the environment variables from the file created above.

The Debian EC2 instances have an "admin" user.

Script 1 "nginx-install"

Will install nginx and start and enable the service.

Script 2 "document-write"

Will write The HTML document below over the default HTML document served by Nginx in Debian. 

Complete the HTML document so that the p tag displays the current date. Get the date from your local machine, not your EC2 instance.

Use command substitution to get the date in the format "day/month/year" in your script.

Reload nginx after updating the HTML document

---
<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <title>Hello World</title>
</head>
<body>
  <h1>Hello World!</h1>
  <p>Today's date is: </p>
</body>
</html>
---

Both scripts should make use of a heredoc

After running both of your scripts in your local development environment you should have a running Nginx server serving the HTML document above, modified to display today's date.

Scripts should be well commented.

Copy and paste both scripts and your environment variables file into the document.

Before shutting down your server show me that you have a working server setup. Demo that you can visit your ip address and see the HTML document you are serving.

Deliverables.

Submit a link to your Git repository that contains the following. 

- Your scripts and environment variables file

- A README.md file that contains screenshots and commands.

Your Git repo should be public so that I can see it.
