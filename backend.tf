terraform {
  backend "s3" {
    bucket = "your-tfstates-bucket"
    key    = "eks/terraform.tfstate"
    region = "eu-west-2"
  }
}
