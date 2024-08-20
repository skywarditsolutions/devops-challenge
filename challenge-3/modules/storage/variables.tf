variable "system" {
  description = "Name of the overall system"
  type        = string
}

variable "environment" {
  description = "Environment within which services are being deployed"
  type        = string
}

variable "bucket_role" {
  description = "Bucket role"
  type        = string
}

variable "encryption_key_deletion_window_days" {
  description = "Number of days in the KMS key deletion window"
  type        = number
}
