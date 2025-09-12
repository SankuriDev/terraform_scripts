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

#Load Balancer for nginx servers
resource "aws_lb" "test-lb" {
  name = "testsetup-nlb"
  internal = false
  load_balancer_type = "network"

  subnets = [
    aws_subnet.test-public-subnet1.id,
    aws_subnet.test-public-subnet2.id
  ]
  enable_deletion_protection = false 
}

resource "aws_lb_target_group" "test-tg" {
  name = "test-tg"
  port = 80
  protocol = "TCP"
  vpc_id = aws_vpc.test-vpc.id
}

resource "aws_lb_target_group_attachment" "testsetup-server1" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id = aws_instance.test-instance1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "testsetup-server2" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id = aws_instance.test-instance2.id
  port = 80
}

resource "aws_lb_listener" "test-nlb-listener1" {
  load_balancer_arn = aws_lb.test-lb.arn
  port = "80"
  protocol = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
}