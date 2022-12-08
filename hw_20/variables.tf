#variable "aws" {
#  type        = string
#  description = "AWS key for instances"
#}

variable "vpc_cidr" {
 type    = string
 default = "10.0.0.0/16"
}
variable "subnet_cidr_public" {
 type    = string
 default = "10.0.1.0/24"
}
variable "subnet_cidr_private" {
 type    = string
 default = "10.0.101.0/24"
}
variable "aws_region" {
 type    = string
 default = "us-east-1"
}
variable "availability_zone" {
 type    = string
 default = "us-east-1a"
}

variable "tags" {
 type = map(any)
 default = {
  Team = "hillel devops"
  Project = "vpc"
  Environment = "dev"
 }
}
