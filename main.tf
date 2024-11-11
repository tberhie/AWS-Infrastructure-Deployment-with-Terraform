
# Provider configuration for AWS
provider "aws" {
  region = var.aws_region
}

# Call the VPC module
module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

# Call the Security Group module
module "security_groups" {
  source = "./modules/securitygroups"
  vpc_id = module.vpc.vpc_id
}

# Call the EC2 module
module "ec2" {
  source           = "./modules/ec2"
  # vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  security_group_id = module.security_groups.nginx_sg_id
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  user_data        = file("scripts/userdata.sh")
}


