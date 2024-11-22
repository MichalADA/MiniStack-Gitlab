# Security Group dla GitLab
resource "aws_security_group" "gitlab_sg" {
  name        = "gitlab-security-group"
  description = "Security Group for GitLab server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr] # Twoje IP dla SSH
  }

  ingress {
    from_port   = 80
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Publiczny dostęp do HTTP/HTTPS
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Ruch wychodzący bez ograniczeń
  }

  tags = {
    Name = "GitLab-SecurityGroup"
  }
}

# Security Group dla Minikube
resource "aws_security_group" "minikube_sg" {
  name        = "minikube-security-group"
  description = "Security Group for Minikube server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr] # Twoje IP dla SSH
  }

  ingress {
    from_port   = 10250
    to_port     = 10255
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Kubernetes API
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Ruch wychodzący bez ograniczeń
  }

  tags = {
    Name = "Minikube-SecurityGroup"
  }
}

# Security Group dla Monitoringu (Grafana i Zabbix)
resource "aws_security_group" "monitoring_sg" {
  name        = "monitoring-security-group"
  description = "Security Group for Monitoring server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr] # Twoje IP dla SSH
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Grafana
  }

  ingress {
    from_port   = 10050
    to_port     = 10051
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Zabbix
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Ruch wychodzący bez ograniczeń
  }

  tags = {
    Name = "Monitoring-SecurityGroup"
  }
}
