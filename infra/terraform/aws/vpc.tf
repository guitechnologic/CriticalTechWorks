# Cria a VPC principal
resource "aws_vpc" "main" {
  # Faixa de IPs privados da rede
  cidr_block = var.vpc_cidr

  # Necessário para resolução de DNS interna
  enable_dns_support = true

  # Necessário para DNS em recursos como EC2, ALB, EKS
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project}-vpc"
    Project = var.project
  }
}

# Internet Gateway
# Permite comunicação da VPC com a internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "${var.project}-igw"
    Project = var.project
  }
}
