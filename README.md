
#  AWS Infrastructure Deployment with Terraform

This repository provides Terraform configurations to deploy a secure and scalable AWS infrastructure. The setup includes:

- Virtual Private Cloud (VPC)
- Public and Private Subnets
- Internet Gateway & NAT Gateway
- Route Tables & Network ACLs
- Security Groups
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG) with Launch Template

✅ Built following Terraform best practices for modularity, security, and high availability.

---

## 📁 Project Structure

```

.
├── main.tf               # Core infrastructure definitions
├── variables.tf          # Input variables
├── outputs.tf            # Output values
├── provider.tf           # AWS provider configuration
├── terraform.tfvars      # User-defined variable values
└── README.md             # Project documentation

````

---

## 🚀 Features

- Fully managed VPC with public and private subnets
- NAT Gateway for secure internet access from private instances
- Auto Scaling Group in private subnet for EC2 instances
- Application Load Balancer in public subnet for traffic distribution
- Separate Security Groups and NACLs for layered security
- Clean, modular, and scalable code structure

---

## 📦 Prerequisites

Before deploying, ensure the following are installed and configured:

- **Terraform CLI** v1.3 or higher
- **AWS CLI** with configured credentials
- **An active AWS account** with necessary IAM permissions

---

## 🔧 Configuration

Customize your infrastructure by editing the `terraform.tfvars` file:

```hcl
aws_region      = "ap-south-1"
ami_id          = "ami-0abcdef1234567890"  # Replace with a valid AMI
instance_type   = "t3.micro"
````

You can further customize subnet CIDRs and other parameters in `variables.tf`.

---

## 🔐 Security Considerations

* EC2 instances in **private subnets** do not have public IPs.
* **NAT Gateway** provides secure outbound access for private instances.
* **Application Load Balancer** accepts HTTP (port 80). Add HTTPS for production use.
* **Security Groups** restrict access between ALB and EC2 instances.
* **Network ACLs** enforce stateless filtering at the subnet level.

---

## 📥 Usage

Initialize the Terraform project:

```bash
terraform init
```

Review the planned changes:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Confirm the apply when prompted. On success, Terraform will output important resource values such as:

```hcl
alb_dns = "app-lb-1234567890.ap-south-1.elb.amazonaws.com"
vpc_id  = "vpc-0abc123def456"
```

To tear down the infrastructure:

```bash
terraform destroy
```

---

## 📤 Outputs

Terraform exports the following values:

* `alb_dns`: DNS name of the Application Load Balancer
* `vpc_id`: ID of the created VPC
* `public_subnet_id`: ID of the public subnet
* `private_subnet_id`: ID of the private subnet

---

## 🧠 Architecture Overview

### Public Subnet

* Hosts: ALB, NAT Gateway
* Internet-accessible via Internet Gateway

### Private Subnet

* Hosts: Auto Scaling EC2 instances
* No public internet access
* Outbound traffic routed through NAT Gateway

### Data Flow

* ALB receives HTTP traffic and forwards it to EC2 instances in private subnet
* Security Groups and NACLs enforce traffic restrictions at multiple layers

---

## 📌 Notes

For production environments, consider:

* Adding HTTPS listener to ALB using ACM (AWS Certificate Manager)
* Enabling ALB and EC2 instance logging (e.g., via CloudWatch)
* Setting up CloudWatch alarms and autoscaling policies
* Multi-AZ deployment for high availability

---



