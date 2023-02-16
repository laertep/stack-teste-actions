terraform {
  required_version = "1.3.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucketlaerte" {
  bucket = "bucketlaerte10"
  acl    = "private"


tags = {
  Name        = "Meu bucket"
  Environment = "Dev"
  Managedby   = "terraform"
  Owner       = "laerte"
 }
}
