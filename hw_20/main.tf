module "vpc" {
  source = "terraform-aws-modules/vpc/aws"


  name = "my-vpc"
  cidr = var.vpc_cidr

  azs             = [var.availability_zone]
  private_subnets = [var.subnet_cidr_public]
  public_subnets  = [var.subnet_cidr_private]

  single_nat_gateway = true
  enable_vpn_gateway = true
  
module "security-group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg"
  description = "Security group for public and private"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [var.sg_public, var.sg_private]
  
  tags = var.tags
  
}

module "ec2_instance-public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "aws"
  monitoring             = true
  vpc_security_group_ids = module.security-group.security-group_id
  subnet_id              = module.vpc.public_subnets[0]

  tags = var.tags
}

module "ec2_instance-private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "aws"
  monitoring             = true
  vpc_security_group_ids = module.security-group.security-group_id
  subnet_id              = module.vpc.private_subnets[0]

  tags = var.tags
}
