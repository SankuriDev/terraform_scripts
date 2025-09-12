output "public_ip" {
  description = "public ip"
  value       = aws_instance.node1.public_ip
}
output "instance_id" {
  description = "instance id"
  value       = aws_instance.node1.id
}