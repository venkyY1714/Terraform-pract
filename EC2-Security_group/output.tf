# Output for all instances
output "instance_ids" {
  description = "The IDs of all EC2 instances"
  value       = aws_instance.myinstance[*].id  # Accessing all instance IDs created by count
}

output "instance_public_ips" {
  description = "The public IP addresses of all EC2 instances"
  value       = aws_instance.myinstance[*].public_ip  # Accessing all public IPs
}

output "instance_private_ips" {
  description = "The private IP addresses of all EC2 instances"
  value       = aws_instance.myinstance[*].private_ip  # Accessing all private IPs
}

# Output for individual instances (first instance with count.index = 0)
output "instance_id_1" {
  description = "The ID of the first EC2 instance"
  value       = aws_instance.myinstance[0].id  # Accessing the first instance
}

output "instance_public_ip_1" {
  description = "The public IP of the first EC2 instance"
  value       = aws_instance.myinstance[0].public_ip
}

output "instance_private_ip_1" {
  description = "The private IP of the first EC2 instance"
  value       = aws_instance.myinstance[0].private_ip
}

# Output for second instance (second instance with count.index = 1)
output "instance_id_2" {
  description = "The ID of the second EC2 instance"
  value       = aws_instance.myinstance[1].id  # Accessing the second instance
}

output "instance_public_ip_2" {
  description = "The public IP of the second EC2 instance"
  value       = aws_instance.myinstance[1].public_ip
}

output "instance_private_ip_2" {
  description = "The private IP of the second EC2 instance"
  value       = aws_instance.myinstance[1].private_ip
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.mysg.id
}
