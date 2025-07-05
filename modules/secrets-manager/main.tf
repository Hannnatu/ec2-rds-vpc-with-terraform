resource "aws_secretsmanager_secret" "rds_secret" {
  name        = var.name
  description = "RDS credentials for Jet MySQL database"
  kms_key_id  = var.kms_key_id

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode(var.secret_data)
}
