variable "vpc_cidr" {
	default = "10.0.0.0/16"
}
variable "subnet_cidr_public" {
 default = "10.0.1.0/24"
}
variable "subnet_cidr_private" {
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
variable "sg_public"
 resource "aws_security_group" "public" {
  vpc_id      = module.vpc.vpc_id
  description = "Allow SSH inbound traffic"
  name        = "public"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
variable "sg_private"
 resource "aws_security_group" "private" {
  vpc_id      = module.vpc.vpc_id
  description = "Allow inbound traffic from public subnet"
  name        = "private"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    security_groups = [aws_security_group.public.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "tags" {
 type = map(any)
 default = {
 Team = "hillel devops"
 Project = "vpc"
 Environment = "dev"
 }
