resource "aws_key_pair" "terraform-demo" {
  key_name   = "aws_terraform"
  public_key = file("aws_terraform.pub")
}

resource "aws_security_group" "web-sg" {
  name = "new-secgrp"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "debian_terraform" {
     ami = var.instance_blueprint
     instance_type = var.instance_type
     vpc_security_group_ids = [aws_security_group.web-sg.id]
     availability_zone = var.aws_region
      tags = {
          Name = "ec2_terraform"
     }

      user_data = <<EOF
     #!/bin/bash
     sudo apt-get update
     sudo apt-get upgrade -y
     sudo apt-get install git docker.io -y
     EOF
}

