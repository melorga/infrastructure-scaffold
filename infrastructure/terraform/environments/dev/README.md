# Dev environment

The `dev` environment composes the in-repo VPC module to stand up a
baseline network in AWS. It is intentionally minimal so it can be
extended (EKS, SageMaker domain, etc.) as the platform grows.

## Prerequisites

- Terraform `>= 1.9, < 2.0`
- AWS credentials with permission to create VPC resources
- An S3 bucket and DynamoDB lock table for remote state (see
  `backend.tf` and update the `TODO` placeholders before `init`)

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

For CI / validation only (no backend, no credentials):

```bash
terraform init -backend=false
terraform validate
```
