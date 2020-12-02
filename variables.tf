# general
variable "profile" {
  description = "Name of AWS credentials profile."
  type        = string
  default     = "default"
}

variable "region" {
  description = "The region to deploy to in AWS."
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "mz-demo"
}

variable "owner" {
  description = "The name of the owner of the project."
  type        = string
  default     = ""
}

variable "env_name" {
  description = "The name of the environment."
  type        = string
  default     = "test"
}

# vpc
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

# eks
variable "instance_types" {
  description = "The EC2 types (sizes) to use for the instances."
  type        = list(string)
  default     = ["t3.medium", "t3.small"]
}

variable "asg_max_size" {
  description = "Maximum size for node pool auto-scaling group."
  type        = number
  default     = 5
}

variable "asg_desired_capacity" {
  description = "Desired size for node pool auto-scaling group."
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Minimum size for node pool auto-scaling group."
  type        = number
  default     = 2
}

