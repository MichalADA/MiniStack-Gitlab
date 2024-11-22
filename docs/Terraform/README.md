Terraform Setup Documentation
Project Overview
This project automates the deployment of three AWS EC2 instances using Terraform:

GitLab Server: Hosts the GitLab service.
Minikube Server: Runs Kubernetes locally on a single-node cluster.
Monitoring Server: Hosts Grafana and Zabbix for monitoring.
All instances are deployed in the same AWS VPC (vpc-0a1e6594b492ec29e) with security groups tailored for their specific use cases.

Folder Structure
terraform/
├── main.tf           # Defines EC2 instances
├── security.tf       # Defines security groups
├── variables.tf      # Variables used across the configuration
├── terraform.tfvars  # Values for variables
├── outputs.tf        # Outputs for referencing Terraform resources
docs/
└── terraform-setup.md  # Documentation for the Terraform setup
Prerequisites
Before running this setup, ensure you have the following:

Terraform installed on your local system. Download Terraform.
An AWS account with IAM user credentials configured locally.
An SSH key pair created in the AWS Console (e.g., minikube.pem).
Public IP address for SSH access (e.g., 46.151.19.183).
Configuration
Variables
The configuration is parameterized using the following variables:

Variable	Description	Example Value
aws_region	The AWS region for the deployment	us-east-1
subnet_id	ID of the subnet to use	subnet-044428798b8d7f71f
key_name	AWS key pair name for SSH access	minikube
vpc_id	ID of the VPC	vpc-0a1e6594b492ec29e
ssh_cidr	CIDR block for SSH access	46.151.19.183/32
The variables are defined in the variables.tf file and populated in terraform.tfvars.

Security Groups
The following security groups are defined:

GitLab Security Group

Ports:
22 (SSH) - Restricted to your IP (ssh_cidr).
80, 443 (HTTP/HTTPS) - Open to the public.
Minikube Security Group

Ports:
22 (SSH) - Restricted to your IP (ssh_cidr).
10250-10255 (Kubernetes API) - Open to the public.
Monitoring Security Group

Ports:
22 (SSH) - Restricted to your IP (ssh_cidr).
3000 (Grafana) - Open to the public.
10050-10051 (Zabbix) - Open to the public.
Deployment Steps
Clone the repository:

git clone <repository-url>
cd terraform
Initialize Terraform: Run the following command to download provider plugins:

terraform init
Plan the deployment: Review the resources to be created:

terraform plan
Apply the configuration: Deploy the infrastructure:

terraform apply
Confirm with yes when prompted.

Access the instances: Use the SSH key to connect to the instances:

ssh -i path/to/minikube.pem ubuntu@<instance-public-ip>