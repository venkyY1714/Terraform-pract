variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "My-VPC"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "public_subnet_name" {
  default = "Public-Subnet-1a"
}

variable "private_subnet_name" {
  default = "Private-Subnet-1b"
}

variable "az_1" {
  default = "us-east-1a"
}

variable "az_2" {
  default = "us-east-1b"
}

variable "igw_name" {
  default = "My-IGW"
}

variable "all_cidr_ipv4" {
  default = "0.0.0.0/0"
}
