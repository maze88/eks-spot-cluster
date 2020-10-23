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
  default     = "eks-ha"
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

