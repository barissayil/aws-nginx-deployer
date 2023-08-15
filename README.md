# AWS Nginx Deployer

This project uses Terraform and Ansible to provision and configure an AWS environment, including a VPC (Virtual Private Cloud), an Internet Gateway, a Subnet, a Route Table, a Security Group, and an EC2 instance. The EC2 instance is configured with Nginx and serves a simple webpage.

## Usage

1. Ensure that Terraform and Ansible are installed on your local machine, and you have the necessary AWS credentials set up.

2. Run `terraform init` to initialize your Terraform workspace.

3. Run `terraform apply` to create the AWS resources.

4. Once the resources have been created, Terraform will output the public IP of the EC2 instance. You can access the webpage by navigating to `http://<public-ip>` in a web browser.

**Note:** Remember to run `terraform destroy` when you're done to delete the resources and avoid unnecessary AWS charges.
