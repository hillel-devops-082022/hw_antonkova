output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "vpc id"
}
output "ec2_instance-public" {
  value       = module.ec2_instance-public[*].id
  description = "Public subnet"
}
output "ec2_instance-private" {
  value       = module.ec2_instance-private[*].id
  description = "Private subnet" 
}
