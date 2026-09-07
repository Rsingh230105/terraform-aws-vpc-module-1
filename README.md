# terraform-aws-vpc

## Overview

This Terraform module creates an AWS VPC with a given CIDR block. It also creates multiple subnets (public and private), and for public subnets, it sets up an Internet Gateway (IGW) and appropriate route tables.

## Features

- Creates a VPC with a specified CIDR block
- Creates public and private subnets
- Creates an Internet Gateway (IGW) for public subnets
- Sets up route tables for public subnets

## Usage

```hcl
module "vpc" {
  source = "../../"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your_vpc_name"
  }

  subnet_config = {
    public_subnet = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
      public     = true  # omit or set false for private
    }
    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "eu-north-1b"
    }
  }
}
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| vpc_config | VPC cidr_block and name | `object` | yes |
| subnet_config | Map of subnets with cidr_block, az, and optional public flag | `map(object)` | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the created VPC |
| public_subnets | Map of public subnet IDs and AZs |
| private_subnets | Map of private subnet IDs and AZs |
