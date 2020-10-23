data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name            = var.project_name
  cidr            = var.vpc_cidr
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags = {
    "Env"   = var.env_name
    "Owner" = var.owner
  }
}

