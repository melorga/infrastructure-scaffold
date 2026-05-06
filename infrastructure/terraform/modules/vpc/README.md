# VPC module

Thin wrapper around [`terraform-aws-modules/vpc/aws`](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
at `~> 5.0`. Exposes the inputs and outputs needed by the rest of
this repo without re-exporting the full upstream surface.

## Usage

```hcl
module "vpc" {
  source = "../../modules/vpc"

  name            = "mlops-dev"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true

  tags = {
    Environment = "dev"
    Project     = "mlops-platform"
  }
}
```

## Inputs

| Name | Type | Default | Description |
| ---- | ---- | ------- | ----------- |
| `name` | `string` | n/a | Identifier applied to created resources. |
| `cidr` | `string` | n/a | VPC CIDR block. |
| `azs` | `list(string)` | n/a | Availability zones. |
| `private_subnets` | `list(string)` | n/a | Private subnet CIDR blocks. |
| `public_subnets` | `list(string)` | n/a | Public subnet CIDR blocks. |
| `enable_nat_gateway` | `bool` | `true` | Provision a single NAT gateway for private subnets. |
| `tags` | `map(string)` | `{}` | Tags applied to all resources. |

## Outputs

| Name | Description |
| ---- | ----------- |
| `vpc_id` | ID of the created VPC. |
| `private_subnet_ids` | IDs of the private subnets. |
| `public_subnet_ids` | IDs of the public subnets. |
