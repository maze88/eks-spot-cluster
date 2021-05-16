# EKS Kubernetes cluster using Spot-Instances and Terraform modules

## Configuration
- Normal terraform variables can be modified in `variables.tf`.
- Backend configuration (see `backend.tf`) is commented out, so will default to storing terraform state locally. To use an S3 bucket, one can uncomment it

## IaC Resources
- `vpc.tf` manages the network infrastructure (VPC, Subnets, IGW, Route Tables...) using the terraform AWS VPC module.
- `eks.tf` manages the Kubernetes cluster using the terraform AWS EKS module.
