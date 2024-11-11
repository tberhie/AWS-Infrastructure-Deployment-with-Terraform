# AWS-Infrastructure-Deployment-with-Terraform

This project demonstrates an end-to-end infrastructure deployment on AWS using Terraform. It includes setting up a virtual private cloud (VPC), security groups, and an EC2 instance configured with Nginx to serve a basic website. The infrastructure is modularized for easy maintenance and reuse.

## Project Overview

This Terraform configuration deploys a complete infrastructure on AWS, including:

1. **VPC Setup**: Creates a virtual private cloud (VPC) with both public and private subnets to organize resources and control network access.
2. **Security Groups**: Configures security groups to allow specific access to the EC2 instance, including HTTP/HTTPS traffic and SSH access restricted to a trusted IP.
3. **EC2 Instance with Nginx**: Launches an EC2 instance in a public subnet, installs Nginx via a user data script, and serves a simple website consisting of three pages: Home, About, and Contact.

## Project Structure

The Terraform configuration is organized into the following files and directories:

- `main.tf`: Main configuration file that calls the modules and sets up dependencies.
- `variables.tf`: Defines the input variables for the project, including network settings, instance details, and the AWS region.
- `outputs.tf`: Configures outputs to display useful information after Terraform deployment, such as the EC2 instance's public IP.
- `scripts/userdata.sh`: User data script that installs Nginx on the EC2 instance, sets up the directory for website files, and creates configuration files for Nginx.
- `modules/`: Contains the modules for VPC, security groups, and EC2 setup.
  - `vpc/`: Configures the VPC, public and private subnets, and internet gateway.
  - `securitygroups/`: Defines security groups to control access.
  - `ec2/`: Sets up the EC2 instance, attaching the security group and public subnet, and passes the user data script for configuration.

## How to Run

### Prerequisites

- **Terraform**: Install Terraform from [https://www.terraform.io/downloads](https://www.terraform.io/downloads).
- **AWS Account**: Ensure you have an AWS account with appropriate permissions to create resources.
- **AWS CLI**: Configure AWS credentials using `aws configure` or set up your credentials in Terraform.

### Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/aws_infrastructure_project.git
   cd aws_infrastructure_project
   ```
2. **Initialize Terraform:** Initialize the project to download necessary provider plugins.

```bash
terraform init
````
3. **Plan the Deployment:** Review the plan to see what resources Terraform will create.
```bash
terraform plan
```
4. **Apply the Configuration:** Deploy the infrastructure to AWS.
```bash
terraform apply
```
5. **Access the Website:**
Once the infrastructure is deployed, you can access the website using the public IP of the EC2 instance, which is displayed in the Terraform output.

### Website Content
The website is a simple three-page project with HTML files:

- index.html: Home page
- about.html: About page
- contact.html: Contact page
Each page includes basic content and navigation links, and Nginx serves these files on the EC2 instance.

### Clean Up
To remove all resources created by this project, use:
```bash
terraform destroy
```
### Notes
- Ensure that the EC2 instance is in a public subnet with an internet gateway attached for public access.
- The SSH access to the EC2 instance is restricted to your IP for security purposes.
