# Terraform AWS 3-Tier Architecture

This project is a **modular AWS 3-Tier Architecture built using Terraform** as an Infrastructure as Code (IaC) solution. It provisions a secure and highly available AWS environment with separate **public, application, and database tiers** across multiple Availability Zones. The public tier contains an **Application Load Balancer**, which distributes incoming traffic to multiple **EC2 application servers** running in private subnets. The database tier uses **Amazon RDS MySQL** in isolated private subnets, accessible only from the application servers through dedicated security groups. The project also includes a **VPC, Internet Gateway, NAT Gateways, route tables, IAM roles, encrypted storage, backups, and security groups**. Terraform is organized into reusable modules for VPC, security groups, IAM, ALB, EC2, and RDS, demonstrating professional Terraform practices. Terraform state is stored remotely in **Amazon S3 with state locking and versioning**, providing safer state management for collaborative infrastructure work. Overall, the project demonstrates practical skills in **Terraform, AWS networking, modular Infrastructure as Code, security, high availability, remote state management, and cloud architecture**, making it a strong portfolio project for an AWS/DevOps role.



A modular Infrastructure as Code project that provisions a highly available
three-tier architecture on AWS using Terraform.
```text
Terraform → Modules → AWS VPC → Multi-AZ → Public/Private Networking → NAT → ALB → EC2 → IAM → RDS → Remote State → State Locking → Encryption → Security Groups → Outputs → GitHub-ready documentation.
 ```
## Architecture

Internet
   |
Application Load Balancer
   |
Private Application EC2 Instances
   |
Private RDS MySQL Database

## AWS Services

- Amazon VPC
- Internet Gateway
- NAT Gateway
- Application Load Balancer
- Amazon EC2
- Amazon RDS MySQL
- IAM
- Amazon S3
- Terraform state locking

## Terraform Concepts Demonstrated

- Infrastructure as Code
- Reusable Terraform modules
- Variables and outputs
- Remote state
- S3 state storage
- Native S3 state locking
- Provider version constraints
- Security groups
- IAM roles
- Dependency management
- Multi-AZ networking
- Private subnets
- Database isolation
- Resource tagging

## Project Structure

```text
terraform-aws-3-tier-architecture/
├── bootstrap/
├── modules/
│   ├── vpc/
│   ├── security-groups/
│   ├── iam/
│   ├── alb/
│   ├── ec2/
│   └── rds/
├── backend.tf
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf
└── terraform.tfvars.example

Prerequisites
AWS account
AWS CLI
Terraform
Existing EC2 key pair
AWS credentials configured locally

Verify:

aws sts get-caller-identity

terraform version
## Step 1 - Create Terraform State Backend
cd bootstrap/backend

terraform init
terraform plan
terraform apply

This creates:

S3 state bucket
S3 versioning
Server-side encryption
Public access protection

## Step 2 - Configure Variables

Copy:

cp terraform.tfvars.example terraform.tfvars

Update:

key_pair_name = "YOUR_KEY_PAIR"
ami_id        = "YOUR_AMI_ID"
db_password   = "YOUR_PASSWORD"

Never commit terraform.tfvars.

## Step 3 - Initialize Terraform
terraform init
## Step 4 - Format
terraform fmt -recursive
## Step 5 - Validate
terraform validate
## Step 6 - Plan
terraform plan
## Step 7 - Deploy
terraform apply

Confirm:
yes
## Step 8 - View Outputs
terraform output

The ALB DNS name can be used to access the application. 

Destroy

When the project is no longer required:

terraform destroy
```
