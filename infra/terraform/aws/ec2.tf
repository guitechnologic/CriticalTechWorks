########################################
# Busca a AMI Amazon Linux 2023
########################################
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  owners = ["amazon"]
}

########################################
# Bastion Host (EC2 Pública)
########################################
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  key_name                    = aws_key_pair.main.key_name
  associate_public_ip_address = true

  tags = {
    Name    = "ctw-bastion"
    Project = var.project
    Role    = "Bastion"
  }
}

########################################
# EC2 Privada (futura aplicação)
########################################
resource "aws_instance" "private_app" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private[0].id
  vpc_security_group_ids = [aws_security_group.private_ec2.id]
  key_name               = aws_key_pair.main.key_name

  tags = {
    Name    = "ctw-private-app"
    Project = var.project
    Role    = "Application"
  }
}


resource "aws_instance" "private_app" {
  count                  = var.instance_count
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private[count.index % 2].id
  vpc_security_group_ids = [aws_security_group.private_ec2.id]
  key_name               = aws_key_pair.main.key_name

  tags = {
    Name    = "ctw-app-${count.index}"
    Project = var.project
    Role    = "Application"
  }
}