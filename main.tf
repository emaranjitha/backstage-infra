# S3
module "s3" {
  source = "./modules/s3"

  bucket_name = "${var.project}-static-host-${var.environment}"
}

# CloudFront
module "cloudfront" {
  source                      = "./modules/cloudfront"
  bucket_name                 = module.s3.bucket
  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  is_enabled                  = var.is_enabled
  is_ipv6_enabled             = var.is_ipv6_enabled
  comment                     = var.comment
  default_root_object         = var.default_root_object
  #domain_names = [module.s3.website_endpoint]

  default_cache_allowed_methods        = var.default_cache_allowed_methods
  default_cache_cached_methods         = var.default_cache_cached_methods
  default_cache_viewer_protocol_policy = var.default_cache_viewer_protocol_policy
  default_cache_min_ttl                = var.default_cache_min_ttl
  default_cache_max_ttl                = var.default_cache_max_ttl
  default_cache_ttl                    = var.default_cache_ttl

  path_pattern                   = var.path_pattern
  ordered_allowed_methods        = var.ordered_allowed_methods
  ordered_cached_methods         = var.ordered_cached_methods
  ordered_cache_min_ttl          = var.ordered_cache_min_ttl
  ordered_cache_max_ttl          = var.ordered_cache_max_ttl
  ordered_cache_default_ttl      = var.ordered_cache_default_ttl
  ordered_viewer_protocol_policy = var.ordered_viewer_protocol_policy
  ordered_cache_compress         = var.ordered_cache_compress
  #ssl_support_method             = var.ssl_support_method
  cloudfront_default_certificate = var.cloudfront_default_certificate
  depends_on                     = [module.s3]
}

