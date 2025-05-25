# Generate SSH Private Key
resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Upload Public Key to AWS as a Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-generated-key"
  public_key = tls_private_key.terraform_key.public_key_openssh
}

# Save Private Key to Local File
resource "local_file" "private_key_pem" {
  content         = tls_private_key.terraform_key.private_key_pem
  filename        = "${path.module}/terraform-key.pem"
  file_permission = "0600"
}

# Create EC2 Instance using the uploaded Key Pair
resource "aws_instance" "myinstance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.myinstype
  key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = "My EC2 Instance"
  }
}
