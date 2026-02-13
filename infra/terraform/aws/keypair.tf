# Registra a chave SSH local na AWS
# Essa chave será usada para acessar as EC2 via SSH
resource "aws_key_pair" "main" {
  key_name   = "ctw-key"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    Name    = "ctw-key"
    Project = var.project
  }
}
