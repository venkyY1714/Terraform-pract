resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-generated-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_instance" "myinstance" {
  ami           =  data.aws_ami.ubuntu.id
  instance_type = var.myinstype
  key_name      = aws_key_pair.generated_key.key_name            
  tags = {
    Name = "My EC2 Instance"
  }
}


resource "local_file" "private_key_pem" {
  content         = tls_private_key.terraform_key.private_key_pem
  filename        = "${path.module}/terraform-key.pem"
  file_permission = "0600"
}





