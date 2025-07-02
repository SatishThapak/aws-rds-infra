# AWS RDS Infrastructure with Terraform

This project provisions a secure MySQL RDS instance within a custom VPC using Terraform. It includes dual availability zone subnets, security groups, subnet groups, and backup configurations. It's built for scalable, production-grade deployment with security at the core.

---

## 📦 Features

- Custom VPC with isolated subnets
- Subnet group for multi-AZ compatibility
- MySQL RDS instance behind a private security group
- Backup retention and snapshot control
- Explicit tagging for resource clarity
- Final snapshot skipped on deletion (`skip_final_snapshot = true`)

---

## ⚙️ Prerequisites

- Terraform CLI v1.3.0+ installed
- AWS CLI configured with valid credentials
- Access to an AWS account with permissions for RDS, VPC, EC2, etc.

---

## 🚀 Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/SatishThapak/aws-rds-infra.git
   cd aws-rds-infra
