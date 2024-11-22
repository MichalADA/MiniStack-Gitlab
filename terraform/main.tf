provider "aws" {
  region = var.aws_region
}

# Instancja EC2 dla GitLab
resource "aws_instance" "gitlab_server" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.medium"
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.gitlab_sg.id] # Użycie ID grupy bezpieczeństwa

  tags = {
    Name = "GitLab-Server"
  }

  depends_on = [aws_security_group.gitlab_sg] # Wymuszenie kolejności
}

# Instancja EC2 dla Minikube
resource "aws_instance" "minikube_server" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.medium"
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.minikube_sg.id] # Użycie ID grupy bezpieczeństwa

  tags = {
    Name = "Minikube-Server"
  }

  depends_on = [aws_security_group.minikube_sg] # Wymuszenie kolejności
}

# Instancja EC2 dla Monitoringu (Grafana i Zabbix)
resource "aws_instance" "monitoring_server" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.medium"
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.monitoring_sg.id] # Użycie ID grupy bezpieczeństwa

  tags = {
    Name = "Monitoring-Server"
  }

  depends_on = [aws_security_group.monitoring_sg] # Wymuszenie kolejności
}
