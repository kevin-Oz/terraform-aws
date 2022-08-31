
variable "aws_region" {
  type    = string
  description = "The AWS region to deploy the EC2 instance in."
  default   = "us-east-1"
}


variable "instance_type" {
  type    = string
  description = "instance type for ec2"
  default   =  "t2.nano"
}


variable "instance_blueprint"{
    type    = string
    description = "instance type for ec2 ( OS )"
    default = "ami-09a41e26df464c548"
}