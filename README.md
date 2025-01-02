AmatipIT Task Documentation

Details of my step by step approach to the task.

This document, details the steps taken to complete the AmatipIT task.including infrastructure setup, configuration, security enhancements, and deployment of an Nginx container using Docker.
1. AWS CLI Configuration

    Downloaded and configured the AWS CLI to interact with AWS services.

    Verified AWS CLI setup by running:

    1.aws configure

    Provided the necessary credentials, access key, secret access key, default region (eu-west-3), and output format.

2. Terraform Project Structure:

    Created a modular Terraform project with the following structure:
        Modules:
            ec2_module: Custom module for EC2 instance provisioning.
            subnet_module: Custom module for subnet creation.
    I used the AWS provider to create resources in AWS.

3. Terraform Remote Backend Configuration:

    I Configured a remote backend using an AWS S3 bucket to store the Terraform state file safely.
    The S3 backend ensures for centralized state management, durability and collaboration.

4. Terraform Commands

    Initialize Terraform:
        Ran terraform init to:
            Initialize the backend.
            Initialize custom modules.
            Download required Terraform and AWS provider plugins.
    Validate Configuration:
        Ran terraform fmt to format the configuration files.
        Ran terraform validate to ensure configuration validity.
    Preview Changes:
        Ran terraform plan to preview the changes before applying them.
    Apply Changes:
        Ran terraform apply to create the defined infrastructure.

5. EC2 Configuration

    Passed commands to install Docker and run an Nginx container as user_data through a script file (script.sh):

    #!/bin/bash
    sudo apt update
    sudo apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ubuntu
    sudo docker pull nginx
    sudo docker run -d --name nginx-container -p 80:80 nginx

    After provisioning, I accessed the server via SSH using my key.pem file to authenticate and login remotely into the server.

6. Security Enhancements:

    Disabling Root Login

    Edited /etc/ssh/sshd_config:
        Searched for the line: PermitRootLogin.
        Changed its value to no.
    Restarted the SSH service to apply changes:

    sudo systemctl restart ssh

 7. Setting Up a Firewall

    I Used UFW (Uncomplicated Firewall) to configure firewall rules:
        Enabled UFW:

sudo ufw enable

Allowed SSH (port 22) and HTTP (port 80) traffic:

        sudo ufw allow ssh
        sudo ufw allow http

8. Verification

   I Verified that Docker and Nginx were installed successfully:
        Checked Docker status:

sudo systemctl status docker

Verified the Nginx container was running:

    sudo docker ps

Confirmed firewall rules:

    sudo ufw status

summary;

    Modular Terraform configuration promotes reusability and scalability.
    Security measures, such as disabling root login and setting up a firewall, enhance server security.
    

