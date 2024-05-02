variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  type        = string
}

variable "is_enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content"
  type        = bool
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution"
  type        = bool
}

variable "comment" {
  description = "Any comments you want to include about the distribution"
  type        = string
}

variable "default_root_object" {
  description = "Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL"
  type        = string
}

#variable "domain_names" {
  #description = "Extra CNAMEs (alternate domain names), if any, for this distribution"
  #type        = string
#}

variable "default_cache_allowed_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin"
  type        = list(string)
}

variable "default_cache_cached_methods" {
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods"
  type        = list(string)
}

variable "default_cache_viewer_protocol_policy" {
  description = "Protocol that users can use to access the files in the origin"
  type        = string
}

variable "default_cache_min_ttl" {
  description = "Minimum amount of time that you want objects to stay in CloudFront caches"
  type        = number
}

variable "default_cache_ttl" {
  description = "Default amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
}

variable "default_cache_max_ttl" {
  description = "Maximum amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
}

variable "path_pattern" {
  description = "Pattern (for example, images/*.jpg) that specifies which requests you want this cache behavior to apply to"
  type        = string
}

variable "ordered_allowed_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin"
  type        = list(string)
}

variable "ordered_cached_methods" {
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods"
  type        = list(string)
}

variable "ordered_cache_min_ttl" {
  description = "Minimum amount of time that you want objects to stay in CloudFront caches"
  type        = number
}

variable "ordered_cache_default_ttl" {
  description = "Default amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
}

variable "ordered_cache_max_ttl" {
  description = "Maximum amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
}

variable "ordered_cache_compress" {
  description = "Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header"
  type        = bool
}

variable "ordered_viewer_protocol_policy" {
  description = "Protocol that users can use to access the files in the origin"
  type        = string
}




variable "cloudfront_default_certificate" {
  description = "If you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution"
  type        = bool
}

