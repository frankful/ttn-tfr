# IAM baseline Terraform module (account-186375393473).
# Provider credentials come from the CI runner environment
# (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY / AWS_REGION).
# State is stored in S3; bucket/key/region/locking are injected by CI
# via -backend-config at init time:
#   bucket       = dcits-prod-pulumi
#   key          = iam-governance-hub/<account-dir>/iam/terraform.tfstate
#   region       = ap-southeast-1
#   use_lockfile = true   (S3 native lock, requires Terraform >= 1.10)

terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {}
}
