# 1. Generate an RSA key pair
resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 2. Upload the public key to AWS as a key pair
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-generated-key"
  public_key = tls_private_key.terraform_key.public_key_openssh
}

# 3. Save the private key locally as a .pem file
resource "local_file" "private_key_pem" {
  content         = tls_private_key.terraform_key.private_key_pem
  filename        = "${path.module}/terraform-key.pem"
  file_permission = "0600"
}

