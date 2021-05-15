# EKS Kubernetes cluster using Spot-Instances and Terraform modules

## Configuration
- Normal terraform variables can be modified in `variables.tf`.
- Default backend configuration is to an S3 bucket, please edit it (bucket name & region) in `backend.tf`, or comment it out to store state locally.
