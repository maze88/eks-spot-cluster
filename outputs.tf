output "availability_zones" {
  description = "The availability zones used in the VPC."
  value       = module.vpc.azs
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "private_subnet_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnet_ids" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets
}

output "kubeconfig_filename" {
  description = "The filename of the generated kubectl config."
  value       = module.eks.kubeconfig_filename
}
