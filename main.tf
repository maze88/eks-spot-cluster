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

  public_subnet_tags  = { "kubernetes.io/cluster/${var.project_name}" = "shared" }
  private_subnet_tags = { "kubernetes.io/cluster/${var.project_name}" = "shared" }
  tags = {
    "Env"   = var.env_name
    "Owner" = var.owner
  }
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name     = var.project_name
  cluster_version  = "1.18"
  write_kubeconfig = false
  subnets          = module.vpc.private_subnets
  vpc_id           = module.vpc.vpc_id

  worker_groups_launch_template = [
    {
      name                    = "spot-pool"
      public_ip               = true
      override_instance_types = var.instance_types
      spot_instance_pools     = length(var.instance_types)
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
      asg_max_size            = var.asg_max_size
      asg_desired_capacity    = var.asg_desired_capacity
      asg_min_size            = var.asg_min_size
    }
  ]

  tags = {
    "Env"   = var.env_name
    "Owner" = var.owner
  }
}
