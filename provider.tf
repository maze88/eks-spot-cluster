terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  version = ">= 3.38.0"
  profile = var.profile
  region  = var.region
  default_tags {
    tags = {
      Environment = var.env_name
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  version                = "~> 1.11"
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}
