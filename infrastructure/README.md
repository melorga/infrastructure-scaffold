# Infrastructure

Infrastructure-as-code for the platform.

## Structure

- `terraform/` - Terraform modules and per-environment compositions.
  - `modules/vpc/` - thin wrapper around
    `terraform-aws-modules/vpc/aws`.
  - `environments/dev/` - dev environment that consumes the VPC
    module.
- `cdk/` - **Not yet implemented.** Reserved for future AWS CDK
  stacks; see the roadmap in the [root README](../README.md).
