# Going to create a ec2-node

resource "aws_instance" "node1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = var.instance_zone
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.terraform-allow-all.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "nod1"
  }
  user_data = <<-EOF
		#!/bin/bash
        sudo curl https://get.docker.com | bash
        sudo usermod -a -G docker ubuntu
        sudo usermod -a -G root ubuntu
        sudo systemctl daemon-reload
        sudo systemctl restart docker
        sudo reboot
        EOF
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }
}