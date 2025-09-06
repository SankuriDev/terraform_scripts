output "public_ip" {
    description = ""
    value = aws_instance.demo.public_ip
}

output "instance_id" {
    description = ""
    value = aws_instance.demo.id
}

