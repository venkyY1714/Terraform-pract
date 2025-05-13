# VPC
resource "aws_vpc" "My-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Public Subnet in AZ us-east-1a
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.My-vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_name
  }
}

# Private Subnet in AZ us-east-1b
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.My-vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.az_2
  tags = {
    Name = var.private_subnet_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "My-igw" {
  vpc_id = aws_vpc.My-vpc.id
  tags = {
    Name = var.igw_name
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc = true
}

# NAT Gateway in public subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "NAT-GW"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.My-vpc.id
  route {
    cidr_block = var.all_cidr_ipv4
    gateway_id = aws_internet_gateway.My-igw.id
  }
  tags = {
    Name = "Public-RT"
  }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.My-vpc.id
  route {
    cidr_block     = var.all_cidr_ipv4
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "Private-RT"
  }
}

resource "aws_route_table_association" "private_rta" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
