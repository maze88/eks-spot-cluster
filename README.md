# EKS Kubernetes cluster using Spot-Instances and Terraform modules

## Configuration
- Normal terraform variables can be modified in `variables.tf`.
- Backend configuration (see `backend.tf`) is commented out, so will default to storing terraform state locally. To use an S3 bucket, one can uncomment it.

## IaC Resources
- `vpc.tf` manages the network infrastructure (VPC, Subnets, IGW, Route Tables...) using the terraform AWS VPC module.
- `eks.tf` manages the Kubernetes cluster using the terraform AWS EKS module.
- `eks.tf` also has an OpenID Connect provider resource for the cluster, which allows association between IAM Roles and Kubernetes ServiceAccounts, enabling pod-specific permissions for AWS resources.

## Caveats
In case of encountering issue with `terrafor destroy`, you may have to manually remove the OIDC provider from IAM and/or from Terraform (`terraform state rm aws_iam_openid_connect_provider.cluster`).
