output "aws_cloudfront_distribution-domain_name" {
  value       = aws_cloudfront_distribution.this.domain_name
  description = "Name of the CloudFront distribution"
}

output "aws_cloudfront_distribution-id" {
  value = aws_cloudfront_distribution.this.id
  description = "Id of the CloudFront distribution"
}