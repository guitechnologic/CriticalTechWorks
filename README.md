# CriticalTechWorks

CriticalTechWorks is a hands-on DevOps & DevSecOps project designed to demonstrate real-world expertise in **Infrastructure as Code**, **Cloud Automation**, **CI/CD**, **Linux**, and **Security by Design**, using AWS and Azure.

This repository serves as a **portfolio-grade reference project**, simulating how a critical technology consultancy would design, automate, secure, and operate cloud infrastructure.

---

## 🎯 Project Goals

- Practice **Infrastructure as Code** using Terraform and Ansible
- Design **scalable and automated cloud environments**
- Apply **DevOps and DevSecOps best practices**
- Implement **Everything as Code**
- Work with **AWS and Azure**
- Strengthen **Linux and container-based infrastructure skills**
- Build CI/CD pipelines using **GitHub Actions**
- Integrate **security from day one**

---

## 🧱 Architecture Overview

The project provisions and manages:

- Cloud infrastructure in **AWS** and **Azure**
- Secure Linux virtual machines
- Containerized applications
- Automated CI/CD pipelines
- Security controls such as:
  - mTLS
  - Certificates lifecycle
  - OIDC / SSO
  - Container and infrastructure scans

---

## 📁 Repository Structure

```text
CriticalTechWorks/
├── docs/                  # Architecture and design documentation
├── infra/
│   ├── terraform/         # IaC for AWS and Azure
│   └── ansible/           # Configuration management
├── containers/            # Docker images
├── scripts/
│   └── bash/              # Bash automation and logic examples
├── security/              # DevSecOps assets and scans
├── .github/
│   └── workflows/         # CI/CD pipelines
└── README.md



🚀 Projeto: CriticalTechWorks

Objetivo do projeto
Criar uma plataforma de infraestrutura cloud-agnostic, automatizada e segura, capaz de provisionar ambientes completos (infra + segurança + pipelines), usando Terraform, Ansible, GitHub Actions e containers, com foco em boas práticas DevOps e DevSecOps.

Esse projeto simula como se você fosse uma consultoria de tecnologia crítica (CriticalTechWorks) entregando ambientes produtivos para clientes.

🧠 Visão Geral da Arquitetura

Você terá:
Infraestrutura como Código
Terraform (AWS e Azure)
Ansible para configuração pós-provisionamento
CI/CD
GitHub Actions
Pipelines reutilizáveis
Containers & Linux
Docker
Linux hardening
DevSecOps
mTLS
SSO (OIDC)
Certificates
Scans de segurança
Cloud
AWS
Azure
Kubernetes (local + cloud)

📁 Estrutura do Repositório
CriticalTechWorks/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── devsecops.md
│   ├── ci-cd.md
│   └── decisions.md
│
├── infra/
│   ├── terraform/
│   │   ├── aws/
│   │   │   ├── vpc/
│   │   │   ├── ec2/
│   │   │   ├── eks/        # opcional
│   │   │   └── iam/
│   │   ├── azure/
│   │   │   ├── vnet/
│   │   │   ├── vm/
│   │   │   ├── aks/        # opcional
│   │   │   └── identity/
│   │   └── modules/
│   │       ├── network/
│   │       ├── compute/
│   │       └── security/
│   │
│   └── ansible/
│       ├── inventories/
│       ├── roles/
│       │   ├── linux-hardening/
│       │   ├── docker/
│       │   ├── security/
│       │   └── monitoring/
│       └── playbooks/
│
├── containers/
│   ├── app/
│   │   └── Dockerfile
│   └── reverse-proxy/
│       └── Dockerfile
│
├── scripts/
│   ├── bash/
│   │   ├── health_check.sh
│   │   ├── recursive_example.sh
│   │   └── cert-generator.sh
│
├── security/
│   ├── certificates/
│   ├── mtls/
│   ├── inspec/
│   └── scans/
│
├── .github/
│   ├── workflows/
│   │   ├── terraform.yml
│   │   ├── ansible.yml
│   │   ├── security-scan.yml
│   │   └── ci.yml
│
└── Makefile

🔹 Infraestrutura como Código
Terraform:
Criar VPC/VNet
Subnets públicas/privadas
Security Groups / NSGs
EC2 + VM Azure
IAM / Managed Identity

Uso de modules reutilizáveis
Remote state (S3 + Azure Blob)

🔹 Linux (infra + containers)
Hardening básico:
SSH seguro
Firewall (ufw / iptables)
Usuários e permissões
Systemd
Logs
Docker instalado e configurado via Ansible

🔹 Automação & CI/CD (Everything as Code)
GitHub Actions para:
Lint & Validate
Terraform fmt / validate
Ansible lint
Plan automático
Apply manual (approval)
Deploy containers
Security scans
Tudo versionado, sem cliques manuais.

🔹 Programação (Bash + lógica)
Scripts Bash com:
Funções
Arrays
Loops
Função recursiva (exemplo real):
Verificação de diretórios
Validação de certificados
Retry exponencial

🔹 DevSecOps (diferencial forte)
Você pode implementar:

🔐 mTLS
Certificados gerados via script
Comunicação segura entre containers

🔑 SSO
GitHub OIDC → AWS IAM
GitHub OIDC → Azure AD

🛡 Security Scans
Trivy / Clair (containers)
Inspec (compliance Linux)
Simulação de Nessus (conceitual + docs)

📜 Certificates lifecycle
Geração
Renovação
Validação automática

🔹 AWS + Azure
Mesma stack em clouds diferentes
Mesmo código, providers diferentes
Comparação documentada (docs/decisions.md)

🔹 Kubernetes (opcional, mas valorizado)
Kind ou k3s local
Deploy simples (nginx + app)
Helm básico
Security context

📌 Metodologia DevOps aplicada

✔ Automação total
✔ CI/CD real
✔ Infraestrutura como código
✔ Segurança integrada desde o início
✔ Colaboração via PR, issues e workflows

