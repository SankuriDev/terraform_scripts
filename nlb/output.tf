output "vpc_id" {
  value = aws_vpc.test-vpc.id
}

output "public_ip" {
  value = aws_instance.test-instance1.public_ip
}

output "nlb_zone_id" {
  value = aws_lb.test-lb.zone_id
}