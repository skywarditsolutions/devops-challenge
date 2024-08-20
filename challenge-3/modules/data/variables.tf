variable "system" {
  description = "Name of the overall system"
  type = string
}

variable "environment" {
  description = "Environment within which services are being deployed"
  type        = string
}

variable "rds_engine" {
  description = "Engine to use in RDS cluster"
  type = string
}

variable "rds_engine_version" {
  description = "Version of engine to use in RDS cluster"
  type = string
}

variable "rds_instance_size" {
  description = "Size of RDS instances to deploy to cluster"
  type = string
}

variable "rds_admin_username" {
  description = "Username of RDS admin user"
  type = string
}

variable "rds_admin_password" {
  description = "Password for RDS admin user"
  type = string
}
