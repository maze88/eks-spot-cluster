# EKS Kubernetes cluster using Spot-Instances and Terraform modules

## Configuration
- Normal terraform variables can be modified in `variables.tf`.
- Default backend configuration is to an S3 bucket, please edit it (bucket name & region) in `backend.tf`, or comment it out to store state locally.

## OIDC
This branch has an OpenID Connect provider resource for the cluster. This allows association between IAM Roles and Kubernetes ServiceAccounts, enabling pod-specific privileges on cloud services and resources.

## Caveats
In case of encountering issue with `terrafor destroy`, you may have to manually remove the OIDC provider from IAM and/or from Terraform (`terraform state rm aws_iam_openid_connect_provider.cluster`).
