provider "aws" {
  # profile = "${var.aws_profile}"
  region            = "${var.aws_region}"
}

terraform {
  required_providers {
    aws = {
      source        = "hashicorp/aws"
      version       = "~> 4.30"
    }
  }
  backend "s3" {

  }
}

locals {
  resource_component = "${var.component_prefix}-${var.component_name}"
}