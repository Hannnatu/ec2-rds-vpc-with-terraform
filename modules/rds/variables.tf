variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "database_subnets" {
  description = "List of DB subnets"
  type        = list(string)
}

variable "allowed_sg_ids" {
  description = "Security groups allowed to access the RDS instance"
  type        = list(string)
  default = aws_security_group.ec2_sg.id
}

variable "db_name" {
  description = "DB name"
  type        = string
}

variable "db_username" {
  description = "DB username"
  type        = string
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage in GB"
  type        = number
  default     = 20
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}
