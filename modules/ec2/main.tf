resource "aws_instance" "nginx_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [var.security_group_id]
  user_data     = var.user_data

  tags = {
    Name = "Midterm Nginx Server"
  }
}

