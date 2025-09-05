provider "aws" {
    region = "ap-south-2"
}

resource "aws_instance" "example2"{
    ami = "ami-031eac8ecb2726fe0"
    instance_type = "t3.micro"
}

