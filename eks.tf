module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name       = var.project_name
  cluster_version    = var.k8s_version
  write_kubeconfig   = true
  config_output_path = "${var.project_name}.kubeconfig"
  subnets            = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id

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
}
