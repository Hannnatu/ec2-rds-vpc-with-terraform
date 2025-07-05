output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.jet_mysql.endpoint
}

output "rds_sg_id" {
  description = "RDS Security Group ID"
  value       = aws_security_group.jet_rds_sg.id
}
