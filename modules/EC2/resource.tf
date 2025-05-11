resource "aws_instance" "myinstance" {
  ami           =  data.aws_ami.ubuntu.id
  instance_type = var.myinstype
  key_name = var.key-name              
  tags = {
    Name = "My EC2 Instance"
  }
}
