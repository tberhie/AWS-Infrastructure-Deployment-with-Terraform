output "nginx_server_ip" {
  value       = module.ec2.instance_public_ip
  description = "Public IP of the Nginx server"
}
