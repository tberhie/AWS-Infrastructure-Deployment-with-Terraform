variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet where the EC2 instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group to associate with the EC2 instance"
  type        = string
}

variable "user_data" {
  description = "User data script to configure Nginx"
  type        = string
}
