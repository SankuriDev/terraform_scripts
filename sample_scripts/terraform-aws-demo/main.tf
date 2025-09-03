provider "aws" {
  region = "ap-south-1"   # or your region
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c50b6f7dc3701ddd" # Amazon Linux 2 AMI (check for your region!)
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformDemo"
  }
}
