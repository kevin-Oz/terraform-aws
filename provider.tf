terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

/* 
provider "aws" {
  region                = var.aws_region
  shared_credentials_file = "/home/lord/.aws/credentials"

} */