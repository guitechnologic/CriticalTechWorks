terraform {
  # Versão mínima do Terraform aceita
  # Evita problemas de compatibilidade
  required_version = ">= 1.5.0"

  # Define o provider AWS e sua versão
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Região padrão onde os recursos serão criados
  region = "us-east-1"

  # Tags aplicadas automaticamente a TODOS os recursos
  # Excelente para governança e billing
  default_tags {
    tags = {
      Project   = "CriticalTechWorks"
      ManagedBy = "Terraform"
    }
  }
}
