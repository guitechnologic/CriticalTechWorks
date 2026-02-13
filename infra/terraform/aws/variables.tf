# Nome do projeto
# Facilita reutilização do código para outros projetos
variable "project" {
  description = "Project name"
  type        = string
  default     = "CriticalTechWorks"
}

# Região AWS
# Em projetos maiores isso vira input por ambiente
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Bloco CIDR da VPC
# Define o tamanho da rede privada
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
