output "public_ip"{
    value = aws_instance.debian_terraform.public_ip
}