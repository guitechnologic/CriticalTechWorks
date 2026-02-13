terraform {
  # Define que o estado do Terraform NÃO ficará local
  # Ele será armazenado remotamente no S3
  backend "s3" {

    # Bucket onde o terraform.tfstate será salvo
    # Permite versionamento, backup e uso em CI/CD
    bucket = "ctw-terraform-state"

    # Caminho do state dentro do bucket
    # Ajuda a separar ambientes ou stacks
    key = "aws/main/terraform.tfstate"

    # Região onde o bucket existe
    region = "us-east-1"

    # Tabela DynamoDB usada para lock do state
    # Evita dois terraform apply ao mesmo tempo
    dynamodb_table = "ctw-terraform-locks"

    # Criptografa o state em repouso
    encrypt = true
  }
}
