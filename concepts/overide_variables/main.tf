provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "demo" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
}