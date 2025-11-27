terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Backend will be configured after initial apply
  backend "s3" {
    bucket         = "peter-mousses-homelab-tf-state"
    key            = "bootstrap/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    use_lockfile   = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "peter-mousses-homelab-tf-state"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_iam_user" "homelab_admin" {
  name = "homelab-admin"
}

resource "aws_iam_user_policy_attachment" "homelab_admin_admin" {
  user       = aws_iam_user.homelab_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "iam_user_name" {
  value = aws_iam_user.homelab_admin.name
}
