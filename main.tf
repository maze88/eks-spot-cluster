data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = var.project_name
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  #enable_dns_hostnames = true
  #enable_dns_support   = true

  tags = {
    "Env"   = var.env_name
    "Owner" = var.owner
  }
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name     = var.project_name
  cluster_version  = "1.18"
  subnets          = module.vpc.private_subnets
  vpc_id           = module.vpc.vpc_id
  write_kubeconfig = false

  worker_groups_launch_template = [
    {
      name                    = "spot-pool"
      override_instance_types = var.spot_instance_types
      spot_instance_pools     = length(var.spot_instance_types)
      asg_max_size            = var.asg_min_size
      asg_desired_capacity    = var.asg_desired_capacity
      asg_max_size            = var.asg_max_size
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
      public_ip               = true
    }
  ]

  tags = {
    "Env"   = var.env_name
    "Owner" = var.owner
  }
}

