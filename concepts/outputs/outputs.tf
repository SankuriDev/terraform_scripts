output "instance_id" {
    description = "Id of EC2 machine we created"
    value = aws_instance.xyz.id
}

output "public_ip" {
    description = "Ip which is reaching through internet"
    value = aws_instance.xyz.public_ip
}