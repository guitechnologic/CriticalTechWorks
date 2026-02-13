########################################
# Security Group - Bastion Host (público)
########################################
resource "aws_security_group" "bastion" {
  name        = "ctw-bastion-sg"
  description = "SSH access from internet"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from anywhere (temporary)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ctw-bastion-sg"
    Project = var.project
  }
}

########################################
# Security Group - EC2 Privada
########################################
resource "aws_security_group" "private_ec2" {
  name        = "ctw-private-ec2-sg"
  description = "SSH only from Bastion"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "SSH from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ctw-private-ec2-sg"
    Project = var.project
  }
}
