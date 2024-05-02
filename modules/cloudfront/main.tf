resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "origin-access-identity/${var.bucket_name}"
}

resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = var.bucket_regional_domain_name
    origin_id   = "S3-${var.bucket_name}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  enabled             = var.is_enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object


  default_cache_behavior {
    allowed_methods  = var.default_cache_allowed_methods
    cached_methods   = var.default_cache_cached_methods
    target_origin_id = "S3-${var.bucket_name}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = var.default_cache_viewer_protocol_policy
    min_ttl                = var.default_cache_min_ttl
    default_ttl            = var.default_cache_ttl
    max_ttl                = var.default_cache_max_ttl
  }

  ordered_cache_behavior {
    path_pattern     = var.path_pattern
    allowed_methods  = var.ordered_allowed_methods
    cached_methods   = var.ordered_cached_methods
    target_origin_id = "S3-${var.bucket_name}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl                = var.ordered_cache_min_ttl
    default_ttl            = var.ordered_cache_default_ttl
    max_ttl                = var.ordered_cache_max_ttl
    compress               = var.ordered_cache_compress
    viewer_protocol_policy = var.ordered_viewer_protocol_policy
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

 
  viewer_certificate {
    cloudfront_default_certificate = true
  }

}
