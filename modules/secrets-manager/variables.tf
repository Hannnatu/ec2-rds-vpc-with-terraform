variable "name" {
  description = "Name of the secret"
  type        = string
}

variable "secret_data" {
  description = "Sensitive data as a map, e.g. username, password"
  type        = map(string)
}

variable "kms_key_id" {
  description = "KMS Key ID to encrypt the secret (optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
