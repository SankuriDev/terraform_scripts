provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "abc" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
        Name = "testing-server2"
    }
}
