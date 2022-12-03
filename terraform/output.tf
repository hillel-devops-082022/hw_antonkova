output "vpc_id" {
  value       = aws_vpc.aws.id
  description = "vpc id"
}
output "subnet_public_id" {
  value       = aws_subnet.public.id
  description = "Public subnet"
}
output "subnet_private_id" {
  value       = aws_subnet.private.id
  description = "Private subnet" 
}
output "security_group_public_id" {
  value       = aws_security_group.public.id
  description = "Public security group"
}
output "security_group_private_id" {
  value       = aws_security_group.private.id
  description = "Private security group"
}
