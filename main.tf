terraform {
  cloud {
    organization = "tf-class-september-20"

    workspaces {
      name = "infra-vpc"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source   = "./vpc/"
  vpc_cidr = "10.0.0.0/20"
}
 variable "vpc_cidr" {
    type = string
 }

 module "subnets" {
   source = "./subnet/"
   vpc_id = module.vpc.vpc_id
   subnets = {
    my_homework_subnet1 = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
    }
    my_homework_subnet2 = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
   }
    my_homework_subnet3 = {
        cidr_block = "10.0.3.0/24"
        availability_zone = "us-east-1c"
   }
  }
}

variable "subnets" {
  type = map(object({
    cidr_block = string
  }))
  default = {}
}