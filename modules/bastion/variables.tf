variable "ami" {
  description = "AMI ID for the Bastion Host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the Bastion Host"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Public subnet ID for the Bastion Host"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "key_name" {
  description = "SSH key name for Bastion"
  type        = string
}

variable "ssh_allowed_ip" {
  description = "CIDR block to allow SSH (e.g., your IP)"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
