output "arn" {
  value       = aws_s3_bucket.default.arn
  description = "ARN of the bucket"
}

output "id" {
  value       = aws_s3_bucket.default.id
  description = "Name of the bucket"
}

output "name" {
  value       = aws_s3_bucket.default.id
  description = "Name of the bucket"
}

output "replication_role_arn" {
  value       = length(local.replication_role_enabled) > 0 ? module.s3_replication_role["create"].arn : try(var.replication_configuration.iam_role_arn, null)
  description = "ARN of the IAM role used for replication: the role created by the module, the role passed in `replication_configuration.iam_role_arn`, or null without replication"
}
