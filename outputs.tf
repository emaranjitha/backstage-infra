
output "deploy_bucket_name" {
  value       = module.s3.bucket
  description = "Deployment bucket name"
}

output "bucket_arn" {
  value       = module.s3.bucket_arn
  description = "ARN of the bucket"
}

output "cloudfront_domain" {
  value       = module.cloudfront.aws_cloudfront_distribution-domain_name
  description = "CloudFront distribution domain name"
}
