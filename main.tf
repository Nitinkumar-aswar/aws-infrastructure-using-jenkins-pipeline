terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
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
  key_name               = "java"
  monitoring             = true
  vpc_security_group_ids = ["sg-03946aa60e5ded4b0"]
  subnet_id              = "subnet-0bf75427a7b9569dd"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
