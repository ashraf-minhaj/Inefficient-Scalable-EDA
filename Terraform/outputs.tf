output "cloudfront_distribution_domain_name" {
    description = "Distribution domain name"
    value       = aws_cloudfront_distribution.destination_distribution.cloudfront_distribution_domain_name
}