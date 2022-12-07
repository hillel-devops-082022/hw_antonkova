output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "vpc id"
}
output "subnet_public_id" {
  value       = var.subnet_cidr_public.public_id
  description = "Public subnet"
}
output "subnet_private_id" {
  value       = var.subnet_cidr_private.private_id
  description = "Private subnet" 
}
