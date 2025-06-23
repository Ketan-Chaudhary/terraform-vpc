variable "aws_region" { default = "ap-south-1" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnet_cidr" { default = "10.0.1.0/24" }
variable "private_subnet_cidr" { default = "10.0.2.0/24" }
variable "ami_id" { description = "AMI ID for EC2" }
variable "instance_type" { default = "t2.micro" }

