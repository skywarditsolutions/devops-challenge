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
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_vpc.system](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_role"></a> [bucket_role](#input_bucket_role) | Bucket role | `string` | n/a | yes |
| <a name="input_encryption_key_deletion_window_days"></a> [encryption_key_deletion_window_days](#input_encryption_key_deletion_window_days) | Number of days in the KMS key deletion window | `number` | n/a | yes |
| <a name="input_environment"></a> [environment](#input_environment) | Environment within which services are being deployed | `string` | n/a | yes |
| <a name="input_system"></a> [system](#input_system) | Name of the overall system | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->