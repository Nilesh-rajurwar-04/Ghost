variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "db_name" {
  description = "Database name"
  default     = "ghost_db"
}

variable "db_username" {
  description = "Database username"
  default     = "ghost_user"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}
