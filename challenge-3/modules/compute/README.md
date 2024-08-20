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
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_lb_target_group.myapp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb_target_group) | data source |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.system](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input_environment) | Environment within which services are being deployed | `string` | n/a | yes |
| <a name="input_inbound_traffic_port"></a> [inbound_traffic_port](#input_inbound_traffic_port) | Port to listen for traffic on | `number` | n/a | yes |
| <a name="input_instance_size"></a> [instance_size](#input_instance_size) | Type of instance to deploy with autoscaling group | `string` | n/a | yes |
| <a name="input_root_volume_size_gb"></a> [root_volume_size_gb](#input_root_volume_size_gb) | Size of the root volume of each node (in gigabytes) | `number` | n/a | yes |
| <a name="input_system"></a> [system](#input_system) | Name of the overall system | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->