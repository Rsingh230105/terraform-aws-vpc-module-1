# terraform-aws-vpc

# Overview
This Terraform module creates an AWS VPC with a given CIDR block . It also creates multiple subnets(public and private), and for public subnets , it sets up an Internet gateway (IGW) and appropriate route tables.


## Features

- Create a VPC with a specified CIDR block
- Create public and private subnets
- Create an Internet gateway for public
subnets
- sets up route tables for public subnets

## Usage
'''
module "vpc" {
    source = "./module/vpc"

    vpc_config = {
        vpc_name = "your_vpc_name"
        cidr_block = "10.0.0.0/16"
    }

    subnet_config = {
        public_subnet = {
            cidr_block = "10.0.0.0/24"
            az = "eu-north-1a"
            public = true
        }
        private_subnet = {
            cidr_block = "10.0.1.0/24"
            az = "eu-north-1b"
            ## if not mention public , so by default private
        }
        
    }
}
'''
