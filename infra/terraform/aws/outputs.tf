# ID da VPC
# Usado por outros módulos ou pipelines
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

# CIDR da VPC
# Útil para troubleshooting e referência
output "vpc_cidr" {
  description = "VPC CIDR"
  value       = aws_vpc.main.cidr_block
}

output "bastion_public_ip" {
  description = "IP publico do Bastion Host"
  value       = aws_instance.bastion.public_ip
}

output "bastion_ssh" {
  description = "Comando SSH para acessar o Bastion"
  value       = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.bastion.public_ip}"
}

output "private_ips" {
  value = [for i in aws_instance.private_app : i.private_ip]
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}
