provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 2.6.6" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "test-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}"
    Owner = "Sankuri Naveen"
    environment = "${var.vpc_environment}"
  }
}

resource "aws_internet_gateway" "test-IGW" {
  vpc_id = aws_vpc.test-vpc.id
  tags = {
    Name = "${var.IGW_name}"
  }
}

resource "aws_subnet" "test-public-subnet1" {
  vpc_id = aws_vpc.test-vpc.id 
  cidr_block = var.pulic_subnet1_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "test-public-subnet2" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.pulic_subnet2_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.public_subnet2_name}"
  }
}

resource "aws_route_table" "test-RT" {
  vpc_id = aws_vpc.test-vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-IGW.id
  }

  tags = {
    Name = "${var.Main_Routing_Table}"
  }
}

resource "aws_route_table_association" "test-public1" {
  subnet_id = aws_subnet.test-public-subnet1.id
  route_table_id = aws_route_table.test-RT.id
}

resource "aws_route_table_association" "test-public2" {
  subnet_id = aws_subnet.test-public-subnet2.id
  route_table_id = aws_route_table.test-RT.id
}

resource "aws_security_group" "test-SG" {
  name = "${var.security_group_name}"
  vpc_id = aws_vpc.test-vpc.id

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}