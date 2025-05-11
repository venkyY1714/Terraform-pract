
provider "aws" {
  region = "ap-south-1"
}

module "security_group" {
  source = "./security_group"
  # Add required variables if any
}

module "ec2_instance" {
  source = "./EC2"
  # Add required variables if any
}
