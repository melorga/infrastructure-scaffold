# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2026-05-05 - Initial VPC module + dev environment + CI

- Add `infrastructure/terraform/modules/vpc` wrapping
  `terraform-aws-modules/vpc/aws ~> 5.0`.
- Add `infrastructure/terraform/environments/dev` that consumes the
  VPC module, with example tfvars and an S3+DynamoDB backend stub.
- Replace the TODO-only CI workflow with `terraform fmt`,
  matrixed `terraform validate`, `tflint --recursive`, and a
  Trivy config scan over `infrastructure/`.
- Remove the redundant `pr-checks.yml` workflow.
- Stop ignoring `.terraform.lock.hcl` so provider versions are
  reproducible.
- Trim Dependabot config to the ecosystems that actually exist
  (`pip`, `terraform`, `github-actions`).
- Honest README and subdirectory placeholders.
