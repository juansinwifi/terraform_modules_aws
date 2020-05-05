resource "aws_s3_bucket" "terraform-bucket" {
  region = var.region
  bucket = var.bucket_name
  acl    = var.bucket_acl
  tags = var.tags
}