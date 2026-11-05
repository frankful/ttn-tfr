# IAM baseline Terraform module (account-186375393473).
# Provider credentials come from the CI runner environment
# (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY / AWS_REGION).
# State path is injected by CI via -backend-config (kept outside the
# workspace so checkout's git clean cannot touch it).

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "local" {}
}
