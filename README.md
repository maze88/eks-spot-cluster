# EKS Kubernetes cluster using Spot-Instances and Terraform modules

## Configuration
- Normal terraform variables can be modified in `variables.tf`.
- Backend configuration (see `backend.tf`) is commented out, so will default to storing terraform state locally. To use an S3 bucket, one can uncomment it
