resource "aws_security_group" "mysg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.allowed_cidr
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = {
    Name = var.sg_tag_name
  }
}
