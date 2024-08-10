terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "t1"

  instance_type          = "t3.micro"
  key_name               = "java" # Ensure this key pair exists in the specified AWS region
  monitoring             = true
  vpc_security_group_ids = ["sg-0ef052a36c14899d4"] # Ensure this security group exists
  subnet_id              = "subnet-0cc4be36c8b6f8600" # Ensure this subnet exists in the specified region

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
