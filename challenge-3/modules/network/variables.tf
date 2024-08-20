variable "system" {
  description = "Name of the overall system"
  type        = string
}

variable "environment" {
  description = "Environment within which services are being deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "IP CIDR for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDRs for the private subnets"
  type        = list(string)
}

variable "inbound_traffic_port" {
  description = "Port to listen for traffic on"
  type        = number
}