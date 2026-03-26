# Terraform GCP Infrastructure

A modular Terraform project that provisions Google Cloud Platform infrastructure across three isolated environments — dev, staging, and prod. Each environment deploys a VPC network and a Cloud Storage bucket using shared reusable modules.

## Project Structure

```
gcp/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   ├── staging/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tfvars
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── bucket/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

Each environment folder is a fully independent Terraform workspace with its own state file. The `modules/` folder contains reusable modules shared across all environments.

## What Gets Created

Each environment provisions:

**VPC module** — creates 4 resources:
- `google_compute_network` — a VPC network
- `google_compute_subnetwork` — a subnet inside the VPC
- `google_compute_firewall` (allow-ssh) — allows SSH from any IP
- `google_compute_firewall` (allow-internal) — allows all traffic within the VPC CIDR

**Bucket module** — creates 1 resource:
- `google_storage_bucket` — a Cloud Storage bucket with versioning support and environment labels

## Environment CIDR Ranges

| Environment | VPC CIDR |
|---|---|
| dev | 10.0.0.0/16 |
| staging | 10.1.0.0/16 |
| prod | 10.2.0.0/16 |

Non-overlapping CIDRs are used so environments can be safely connected via VPC peering if needed.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- A GCP project with billing enabled
- Compute Engine API and Cloud Storage API enabled

### Authenticate with GCP

```bash
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
```

## Usage

Each environment is deployed independently. Navigate into the environment folder and run the standard Terraform workflow.

### Deploy dev

```bash
cd gcp/environments/dev
```

Update `terraform.tfvars` with your real values:

```hcl
project_id         = "your-gcp-project-id"
bucket_name        = "your-unique-bucket-name-dev"
location           = "US"
region             = "us-central1"
versioning_enabled = false
```

Then run:

```bash
terraform init
terraform plan
terraform apply
```

### Deploy staging

```bash
cd gcp/environments/staging
# update terraform.tfvars
terraform init
terraform plan
terraform apply
```

### Deploy prod

```bash
cd gcp/environments/prod
# update terraform.tfvars
terraform init
terraform plan
terraform apply
```

### Tear down an environment

```bash
cd gcp/environments/dev
terraform destroy
```

## Outputs

After a successful `apply`, each environment prints:

| Output | Description |
|---|---|
| `{env}_bucket_name` | Name of the created GCS bucket |
| `{env}_bucket_url` | gs:// URL of the bucket |
| `{env}_vpc_id` | ID of the VPC network |
| `{env}_vpc_name` | Name of the VPC network |
| `{env}_subnet_id` | ID of the subnet |
| `{env}_subnet_cidr` | CIDR block of the subnet |

## Module Inputs

### vpc module

| Variable | Type | Default | Description |
|---|---|---|---|
| `project_id` | string | required | GCP project ID |
| `region` | string | required | Region for the subnet |
| `vpc_cidr` | string | `10.0.0.0/16` | CIDR block for the subnet |
| `environment` | string | `dev` | Environment label for resource names |

### bucket module

| Variable | Type | Default | Description |
|---|---|---|---|
| `bucket_name` | string | required | Globally unique bucket name |
| `location` | string | `US` | GCP bucket location |
| `versioning_enabled` | bool | `false` | Enable object versioning |
| `environment` | string | `dev` | Environment label |

## Important Notes

- **Bucket names are globally unique across all of GCP.** Use a name like `yourname-project-env-2024` to avoid conflicts.
- **`terraform.tfvars` contains your real project ID.** Do not commit real credentials to a public repository.
- **State is isolated per environment.** Running `terraform destroy` in dev will not affect staging or prod.
- **`force_destroy = true`** is set on the bucket — this allows Terraform to delete the bucket even if it contains objects. Change to `false` for production use.

## Provider

```hcl
hashicorp/google ~> 5.0
```