terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.59.0"  # only allow the patch to increment (less than 3.60.0)
    }
  }
  required_version = ">= 1.0.0"
}
