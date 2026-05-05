# infrastructure-scaffold

A starter scaffold for an AWS-based MLOps platform. **Today the repo
ships a single Terraform VPC module, one dev environment that wires
it up, and a CI pipeline that lints / validates / scans the
Terraform.** Everything else (SageMaker, EKS, CodePipeline,
application code, docs) is on the roadmap below and not yet
implemented.

## What's in the box

```text
.
├── .github/workflows/ci.yml         # fmt + validate + tflint + trivy
├── infrastructure/
│   └── terraform/
│       ├── modules/
│       │   └── vpc/                 # wrapper around terraform-aws-modules/vpc
│       └── environments/
│           └── dev/                 # consumes the VPC module
├── mlops/                           # placeholder, not yet implemented
├── src/                             # placeholder, not yet implemented
└── docs/                            # placeholder, not yet implemented
```

## Quick start

Validate locally without AWS credentials:

```bash
cd infrastructure/terraform/environments/dev
terraform init -backend=false
terraform validate
```

Deploy (requires AWS credentials and a real S3/DynamoDB backend):

```bash
cd infrastructure/terraform/environments/dev
cp terraform.tfvars.example terraform.tfvars
# edit backend.tf to point at your bucket / lock table
terraform init
terraform plan
terraform apply
```

## Versions

| Tool | Version |
| ---- | ------- |
| Terraform | `>= 1.9, < 2.0` (CI pins `1.9.8`) |
| AWS provider | `~> 6.0` |
| `terraform-aws-modules/vpc/aws` | `~> 5.0` |
| Python (CI) | `3.12` |

## Roadmap (NOT yet implemented)

These are aspirational and explicitly **not** present in the repo
yet. Tracked here so the intent of the scaffold is documented.

- **SageMaker** for model training and hosting
- **EKS** for container orchestration of inference workloads
- **CodePipeline** for CI/CD of model artifacts
- **CDK** stacks alongside the Terraform under `infrastructure/cdk/`
- **MLOps pipelines** under `mlops/pipelines/` and reusable
  components under `mlops/components/`
- **Training and inference code** under `src/training/` and
  `src/inference/`
- **Architecture docs and diagrams** under `docs/`

## License

See [LICENSE](./LICENSE).
