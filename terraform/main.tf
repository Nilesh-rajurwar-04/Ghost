terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "ghost_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "ghost-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.ghost_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "ghost-public-subnet"
  }
}

resource "aws_db_instance" "ghost" {
  identifier     = "ghost-db"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  skip_final_snapshot = true

  tags = {
    Name = "ghost-database"
  }
}
