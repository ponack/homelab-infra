# Homelab AWS Infrastructure

OpenTofu-managed AWS infrastructure for my homelab. Provisions a VPC with public subnets across two availability zones, with an internet gateway for outbound access.

## Structure

| File | Purpose |
|------|---------|
| `main.tf` | Provider configuration and S3 backend |
| `vpc.tf` | VPC, subnets, internet gateway, and route tables |
| `variables.tf` | Input variables with validation |
| `outputs.tf` | Exported resource IDs |
| `s3.tf` | S3 buckets for backups and data retention |

## Prerequisites

- OpenTofu >= 1.6.0
- AWS credentials with appropriate IAM permissions
- S3 bucket `homelab-terraform-state` and DynamoDB table `homelab-terraform-locks` for remote state (bootstrapped separately)

## Usage

```bash
tofu init
tofu plan -var="environment=prod"
tofu apply -var="environment=prod"
```

## Network Layout

```
10.0.0.0/16 (VPC)
├── 10.0.1.0/24  — public-1 (us-east-1a)
└── 10.0.2.0/24  — public-2 (us-east-1b)
```
