variable "system" {
  description = "Name of the overall system"
  type        = string
}

variable "environment" {
  description = "Environment within which services are being deployed"
  type        = string
}

variable "instance_size" {
  description = "Type of instance to deploy with autoscaling group"
  type        = string
}

variable "root_volume_size_gb" {
  description = "Size of the root volume of each node (in gigabytes)"
  type        = number
}

variable "inbound_traffic_port" {
  description = "Port to listen for traffic on"
  type        = number
}