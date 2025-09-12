variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}
variable "public_subnet1_name" {}
variable "public_subnet2_name" {}
variable "public_subnet3_name" {}
variable "Main_Routing_Table" {}
variable "env" { default = "env" }

variable "ami_id" {}
variable "instance_zone" {}
variable "instance_type" {}
variable "volume_size" {}
variable "volume_type" {}