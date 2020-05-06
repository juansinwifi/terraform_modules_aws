data "aws_s3_bucket" "selected" {
  bucket = var.bucket_name
}

locals {
  s3_origin_id = format("S3-%s", data.aws_s3_bucket.selected.bucket) 
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  
  origin {
         domain_name = data.aws_s3_bucket.selected.bucket_domain_name
         origin_id   = local.s3_origin_id
  }

  enabled   = true

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags      = {
    Environment = "Prod"
  }

}
 
