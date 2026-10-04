# S3 Bucket Provisioning.
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "jeff-devops-bucket-v2"
    key = "staging/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "staging_bucket" {
  bucket = "my-staging-bucket-${var.random_suffix}"

  tags = {
    Name = "Staging Bucket"
    ManagedBy = "Terraform via GitHub Actions"
  }
}