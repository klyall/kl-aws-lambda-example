variable "account_id" {
}

variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  version = "~> 1.0"
  region  = "${var.region}"
}

variable "bucket_name" {
  default = "kl-aws-lambda-example"
}

