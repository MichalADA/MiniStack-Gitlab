
---

## Prerequisites
Before running this setup, ensure you have the following:
1. **Terraform** installed on your local system. [Download Terraform](https://www.terraform.io/downloads).
2. An **AWS account** with IAM user credentials configured locally.
3. An **SSH key pair** created in the AWS Console (e.g., `minikube.pem`).
4. **Public IP address** for SSH access.

---

## Configuration

### Variables
The configuration is parameterized using the following variables:

| Variable      | Description                      | Example Value              |
|---------------|----------------------------------|----------------------------|
| `aws_region`  | The AWS region for the deployment | `us-east-1`               |
| `subnet_id`   | ID of the subnet to use          | `subnet-044428798b8d7f71f` |
| `key_name`    | AWS key pair name for SSH access | `minikube`                |
| `vpc_id`      | ID of the VPC                   | `vpc-0a1e6594b492ec29e`   |
| `ssh_cidr`    | CIDR block for SSH access        | `<Your Public IP>/32`     |

The variables are defined in the `variables.tf` file and populated in `terraform.tfvars`.

---

## Security Groups

### GitLab Security Group
- **Ports**:
  - `22` (SSH) - Restricted to your IP (`ssh_cidr`).
  - `80, 443` (HTTP/HTTPS) - Open to the public.

### Minikube Security Group
- **Ports**:
  - `22` (SSH) - Restricted to your IP (`ssh_cidr`).
  - `10250-10255` (Kubernetes API) - Open to the public.

### Monitoring Security Group
- **Ports**:
  - `22` (SSH) - Restricted to your IP (`ssh_cidr`).
  - `3000` (Grafana) - Open to the public.
  - `10050-10051` (Zabbix) - Open to the public.

---

## Deployment Steps

### Clone the Repository
```bash
git clone <repository-url>
cd terraform
