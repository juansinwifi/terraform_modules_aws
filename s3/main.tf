provider "aws" {
    region="us-east-1"
}
resource "aws_s3_bucket" "terraform-bucket" {
  bucket = var.bucket_name
  acl    = var.bucket_acl
  tags = var.tags
}