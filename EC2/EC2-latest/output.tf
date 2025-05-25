output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.myinstance.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.myinstance.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.myinstance.private_ip
}

output "key_name" {
  value = aws_key_pair.terraform_key.key_name
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}
