variable "aws_region" {
  description = "AWS region"
  default = "ap-south-1"
}

variable "vpc_name" {
  description = "VPC NAME"
  default = "testsetup1-vpc"
}

variable "vpc_cidr" {
  description = "address space for VPC"
  default = "10.18.0.0/16"
}

variable "vpc_environment" {
  description = "Which environment { dev, prod, test etc}"
  default = "dev"
}

variable "IGW_name" {
  description = "IGW"
  default = "testsetup1-IGW"
}

variable "public_subnet1_name" {
  description = "public_subnet_name"
  default = "testsetup1-public-subnet-1"
}

variable "pulic_subnet1_cidr" {
  description = "pulic_subnet_cidr"
  default = "10.18.1.0/24"
}

variable "public_subnet2_name" {
  description = "public_subnet_name"
  default = "testsetup1-public-subnet-2"
}

variable "pulic_subnet2_cidr" {
  description = "pulic_subnet_cidr"
  default = "10.18.2.0/24"
}

variable "Main_Routing_Table" {
  description = "Main_Routing_Table"
  default = "testsetup1-rt"
}

variable "security_group_name" {
  description = "Allow all inbound traffic"
  default = "allow-all"
}

variable "aws_ami" {
  description = "aws_ami"
  default = "ami-02d26659fd82cf299"
}

variable "instance_type" {
  description = "instance_type"
  default = "t2.micro"
}