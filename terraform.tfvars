# Common
project     = "backstage-infra"
environment = "dev"
region      = "us-east-1"



# CloudFront
is_enabled          = true
is_ipv6_enabled     = true
comment             = "CloudFront distribution of mspockart app"
default_root_object = "index.html"


default_cache_allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
default_cache_cached_methods         = ["GET", "HEAD"]
default_cache_viewer_protocol_policy = "allow-all"
default_cache_min_ttl                = 0
default_cache_ttl                    = 3600
default_cache_max_ttl                = 86400

path_pattern                   = "/*"
ordered_allowed_methods        = ["GET", "HEAD", "OPTIONS"]
ordered_cached_methods         = ["GET", "HEAD", "OPTIONS"]
ordered_viewer_protocol_policy = "redirect-to-https"
ordered_cache_min_ttl          = 0
ordered_cache_default_ttl      = 86400
ordered_cache_max_ttl          = 31536000
ordered_cache_compress         = true

cloudfront_default_certificate = false
