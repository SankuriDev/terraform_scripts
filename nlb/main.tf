resource "aws_instance" "test-instance1" {
  ami = var.aws_ami
  availability_zone = "ap-south-1a"
  instance_type = var.instance_type
  key_name = "k8s_test"
  subnet_id = aws_subnet.test-public-subnet1.id 
  vpc_security_group_ids = ["${aws_security_group.test-SG.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "testsetup-server1"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
  root_block_device {
    volume_size = "10"
    volume_type = "gp2"
    delete_on_termination = true
  }

}

resource "aws_instance" "test-instance2" {
  ami = var.aws_ami
  availability_zone = "ap-south-1b"
  instance_type = var.instance_type
  key_name = "k8s_test"
  subnet_id = aws_subnet.test-public-subnet2.id 
  vpc_security_group_ids = ["${aws_security_group.test-SG.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "testsetup-server2"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
  root_block_device {
    volume_size = "10"
    volume_type = "gp2"
    delete_on_termination = true
  }
}