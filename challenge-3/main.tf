locals {
  system = "challenge"
  environment = "dev"
  aws_region = "us-east-2"
}

module network {
  source = "./modules/network"

  system  = local.system
  environment   = local.environment

  vpc_cidr = "192.168.0.0/16"
  
  public_subnet_cidrs = [
    "192.168.1.0/24",
    "192.168.2.0/24",
    "192.168.3.0/24"
  ]
  private_subnet_cidrs = [
    "192.168.4.0/24",
    "192.168.5.0/24",
    "192.168.6.0/24"
  ]
  
  inbound_traffic_port = 80
}

module "compute" {
  source = "./modules/compute"
  depends_on = [ module.network ]

  system  = local.system
  environment   = local.environment

  instance_size = "t3a.medium"
  root_volume_size_gb = 16
  inbound_traffic_port = 80
}

module "data" {
  source = "./modules/data"
  depends_on = [ module.network ]

  system  = local.system
  environment   = local.environment

  rds_engine = "aurora-postgresql"
  rds_engine_version = "16.3"
  rds_instance_size = "db.t3.medium"
  rds_admin_username = "dbadmin"
  rds_admin_password = "MyPassword081924"
}

module "storage" {
  source = "./modules/storage"
  depends_on = [ module.network ]

  system  = local.system
  environment   = local.environment

  bucket_role = "assets"
  encryption_key_deletion_window_days = 10
}