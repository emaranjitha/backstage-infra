output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "ARN of the bucket"
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.this.bucket_regional_domain_name
  description = "The bucket region-specific domain name"
}

output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "Name of the bucket"
}

/*output website_endpoint {
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
  description = "The website endpoint for the S3 bucket"
}*/