<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_security_group.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.system](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input_environment) | Environment within which services are being deployed | `string` | n/a | yes |
| <a name="input_rds_admin_password"></a> [rds_admin_password](#input_rds_admin_password) | Password for RDS admin user | `string` | n/a | yes |
| <a name="input_rds_admin_username"></a> [rds_admin_username](#input_rds_admin_username) | Username of RDS admin user | `string` | n/a | yes |
| <a name="input_rds_engine"></a> [rds_engine](#input_rds_engine) | Engine to use in RDS cluster | `string` | n/a | yes |
| <a name="input_rds_engine_version"></a> [rds_engine_version](#input_rds_engine_version) | Version of engine to use in RDS cluster | `string` | n/a | yes |
| <a name="input_rds_instance_size"></a> [rds_instance_size](#input_rds_instance_size) | Size of RDS instances to deploy to cluster | `string` | n/a | yes |
| <a name="input_system"></a> [system](#input_system) | Name of the overall system | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->