# Descobre automaticamente as AZs disponíveis na região
data "aws_availability_zones" "available" {}

# Subnets públicas
# Usadas para Load Balancer, NAT, Bastion
resource "aws_subnet" "public" {
  count = 2

  # Subnet pertence à VPC principal
  vpc_id = aws_vpc.main.id

  # Divide o CIDR da VPC em blocos menores
  cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index)

  # Cada subnet em uma AZ diferente
  availability_zone = data.aws_availability_zones.available.names[count.index]

  # Instâncias recebem IP público automaticamente
  map_public_ip_on_launch = true

  tags = {
    Name    = "ctw-public-${count.index}"
    Project = "CriticalTechWorks"
    Type    = "Public"
  }
}

# Subnets privadas
# Usadas para aplicações, bancos, containers
resource "aws_subnet" "private" {
  count = 2

  vpc_id = aws_vpc.main.id

  # CIDRs diferentes das públicas (sem sobreposição)
  cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index + 10)

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name    = "ctw-private-${count.index}"
    Project = "CriticalTechWorks"
    Type    = "Private"
  }
}
