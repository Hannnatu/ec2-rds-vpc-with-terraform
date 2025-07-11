output "secret_arn" {
  description = "ARN of the secret"
  value       = aws_secretsmanager_secret.rds_secret.arn
}

output "secret_name" {
  description = "Name of the secret"
  value       = aws_secretsmanager_secret.rds_secret.name
}
