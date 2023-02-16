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

resource "aws_s3_bucket_website_configuration" "bucketlaerte" {
  bucket = aws_s3_bucket.bucketlaerte10.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "page_index" {
  bucket       = aws_s3_bucket.bucketlaerte10.bucket
  key          = "index.html"
  content_type = "text/html; character=UTF-8"
  source       = "website/index.html"
  etag         = filemd5("website/index.html")
}
