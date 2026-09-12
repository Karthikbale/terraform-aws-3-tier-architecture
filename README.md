# Terraform AWS 3-Tier Architecture

A modular Infrastructure as Code project that provisions a highly available
three-tier architecture on AWS using Terraform.

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
