output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.jet_alb.dns_name
}

output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb_sg.id
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.jet_tg.arn
}
